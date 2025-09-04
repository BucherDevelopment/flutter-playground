import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_planner/models/task.dart';

class TasksNotifier extends StateNotifier<List<Task>> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _tasksCollection = FirebaseFirestore.instance
      .collection('tasks');

  StreamSubscription<QuerySnapshot>? _tasksSubscription;

  TasksNotifier() : super([]) {
    // Abonniere die Authentifizierungsänderungen
    _auth.authStateChanges().listen((user) {
      // Bestehenden Tasks-Listener abbrechen, falls vorhanden
      _tasksSubscription?.cancel();

      if (user == null) {
        // Kein Nutzer angemeldet, setze den State leer
        state = [];
      } else {
        // Starte einen neuen Listener für die Tasks-Subcollection des aktuellen Nutzers
        _tasksSubscription = _firestore
            .collection('users')
            .doc(user.uid)
            .collection('tasks')
            .snapshots()
            .listen((snapshot) {
              final tasks =
                  snapshot.docs.map((doc) => Task.fromFirestore(doc)).toList();
              state = tasks;
            });
      }
    });
  }

  Future<void> addTask(
    String title,
    String description,
    Priority priority,
  ) async {
    final currentUser = _auth.currentUser;
    await _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .collection('tasks')
        .add({
          'title': title,
          'description': description,
          'priority': priority.toString(),
          'isCompleted': false,
        });
  }

  Future<void> deleteTask(String id) async {
    final currentUser = _auth.currentUser;
    if (currentUser == null) return;
    await _firestore
        .collection('users')
        .doc(currentUser.uid)
        .collection('tasks')
        .doc(id)
        .delete();
  }

  Future<void> toggleTaskCompletion(String id) async {
    final currentUser = _auth.currentUser;
    if (currentUser == null) return;
    final taskIndex = state.indexWhere((task) => task.id == id);
    if (taskIndex == -1) return;
    final currentTask = state[taskIndex];
    await _firestore
        .collection('users')
        .doc(currentUser.uid)
        .collection('tasks')
        .doc(id)
        .update({'isCompleted': !currentTask.isCompleted});
  }

  void reorderTasks(int oldIndex, int newIndex) {
    // Falls newIndex größer als oldIndex ist, anpassen
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final task = state.removeAt(oldIndex);
    state.insert(newIndex, task);
    // State aktualisieren (abhängig davon, wie dein StateNotifier aufgebaut ist)
    state = List.from(state);
  }
}

final tasksProvider = StateNotifierProvider<TasksNotifier, List<Task>>(
  (ref) => TasksNotifier(),
);
