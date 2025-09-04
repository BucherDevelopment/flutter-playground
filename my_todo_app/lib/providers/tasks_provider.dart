import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo_app/data/dummy_tasks.dart';
import 'package:my_todo_app/models/task.dart';

class TasksNotifier extends StateNotifier<List<Task>> {
  TasksNotifier() : super(dummyTasks);

  void setTaskCompletionStatus(String id, bool isCompleted) {
    final taskIndex = state.indexWhere((task) => task.id == id);
    state[taskIndex].isCompleted = isCompleted;
    state = List.from(state);
  }

  void addTask(String title, String description) {
    final newTask = Task(
      id: Random().toString(),
      title: title,
      description: description,
      isCompleted: false,
    );
    state = [...state, newTask];
  }

  void deleteTask(String id) {
    state = state.where((task) => task.id != id).toList();
  }
}

final tasksProvider = StateNotifierProvider<TasksNotifier, List<Task>>((ref) {
  return TasksNotifier();
});
