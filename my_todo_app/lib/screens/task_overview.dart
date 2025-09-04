import 'package:flutter/material.dart';
import 'package:my_todo_app/models/task.dart';
import 'package:my_todo_app/widgets/task_list.dart';

class TaskOverviewScreen extends StatelessWidget {
  const TaskOverviewScreen({super.key, required this.tasks});
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TaskList(tasks: tasks));
  }
}
