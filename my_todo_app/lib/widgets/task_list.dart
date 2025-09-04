import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:my_todo_app/models/task.dart';
import 'package:my_todo_app/providers/tasks_provider.dart';

class TaskList extends ConsumerWidget {
  const TaskList({super.key, required this.tasks});
  final List<Task> tasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (ctx, index) {
        return Card(
          child: CheckboxListTile(
            value: tasks[index].isCompleted,
            onChanged: (value) {
              ref
                  .read(tasksProvider.notifier)
                  .setTaskCompletionStatus(tasks[index].id, value!);
            },
            title: Text(tasks[index].title),
            subtitle: Text(DateFormat.MMMEd().format(tasks[index].date)),
            secondary: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                ref.read(tasksProvider.notifier).deleteTask(tasks[index].id);
              },
            ),
          ),
        );
      },
    );
  }
}
