import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/dummy_tasks.dart';
import '../models/task.dart';

class TasksNotifier extends StateNotifier<List<Task>> {
  TasksNotifier() : super(dummyTasks);
  void addTask(String title, String description, DateTime untilDate) {
    final newTask = Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      isCompleted: false,
      untilDate: untilDate,
    );
    state = [...state, newTask];
  }

  void removeTask(String id) {
    state = state.where((task) => task.id != id).toList();
  }

  List<Task> getCompletedTasks() {
    return state.where((task) => task.isCompleted).toList();
  }

  List<Task> getUncompletedTasks() {
    return state.where((task) => !task.isCompleted).toList();
  }

  void toggleTaskCompleted(String id) {
    state = state
        .map(
          (task) => task.id == id
              ? Task(
                  id: task.id,
                  title: task.title,
                  description: task.description,
                  isCompleted: !task.isCompleted,
                  untilDate: task.untilDate,
                )
              : task,
        )
        .toList();
  }
}

final tasksProvider = StateNotifierProvider<TasksNotifier, List<Task>>(
  (ref) => TasksNotifier(),
);
