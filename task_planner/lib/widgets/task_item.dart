import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_planner/models/task.dart';
import 'package:task_planner/providers/tasks_provider.dart';

class TaskItem extends ConsumerWidget {
  const TaskItem(this.index, {super.key, required this.task});
  final Task task;
  final int index;

  IconData getPriorityIcon(Priority priority) {
    switch (priority) {
      case Priority.high:
        return Icons.priority_high;
      case Priority.medium:
        return Icons.task;
      case Priority.low:
        return Icons.sports_bar;
    }
  }

  final List<PopupMenuItem<String>> _popUpItems = const [
    PopupMenuItem<String>(
      value: "edit",
      child: Row(children: [Icon(Icons.settings), Text("  bearbeiten")]),
    ),
    PopupMenuItem<String>(
      value: "delete",
      child: Row(children: [Icon(Icons.delete), Text(" löschen")]),
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: Colors.blue,
      child: SizedBox(
        width: 320,
        height: 320,

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 8),
                  Icon(getPriorityIcon(task.priority), color: Colors.white),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      task.title,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.copyWith(color: Colors.white),
                    ),
                  ),

                  PopupMenuButton<String>(
                    icon: Icon(Icons.more_vert, color: Colors.white),
                    itemBuilder: (context) {
                      return _popUpItems;
                    },
                    onSelected: (value) {
                      if (value == "delete") {
                        ref.read(tasksProvider.notifier).deleteTask(task.id);
                      }
                    },
                  ),

                  SizedBox(width: 8),
                ],
              ),
            ),
            Card(
              color: Colors.lightBlue,
              child: SizedBox(
                width: 250,
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    task.description,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: Colors.white),
                    softWrap: true, // Text wird bei Bedarf umgebrochen
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  ref
                      .read(tasksProvider.notifier)
                      .toggleTaskCompletion(task.id);
                },
                icon: Icon(
                  task.isCompleted
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                ),
                label: Text(
                  task.isCompleted ? 'mark as not done' : 'mark as done',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
