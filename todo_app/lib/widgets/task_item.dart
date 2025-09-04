import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/task.dart';
import '../providers/tasks_provider.dart';

class TaskItem extends ConsumerWidget {
  const TaskItem({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: ValueKey(task.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        ref.read(tasksProvider.notifier).removeTask(task.id);
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: IconButton(
            onPressed: () {
              ref.read(tasksProvider.notifier).removeTask(task.id);
            },
            icon: const Icon(Icons.delete),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          title: Text(
            task.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (task.description != null && task.description!.isNotEmpty)
                Text(task.description!),

              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  'Bis: ${DateFormat.yMMMd().format(task.untilDate)}',
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ),
            ],
          ),
          trailing: Icon(
            task.isCompleted
                ? Icons.check_circle
                : Icons.radio_button_unchecked,
            color: task.isCompleted ? Colors.green : Colors.grey,
            size: 28,
          ),
          onTap: () {
            ref.read(tasksProvider.notifier).toggleTaskCompleted(task.id);
          },
        ),
      ),
    );
  }
}
