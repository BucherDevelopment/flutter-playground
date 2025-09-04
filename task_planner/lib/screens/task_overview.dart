import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_planner/providers/filters_provider.dart';
import 'package:task_planner/providers/tasks_provider.dart';
import 'package:task_planner/widgets/task_item.dart';

class TaskOverviewScreen extends ConsumerWidget {
  const TaskOverviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displaySetting = ref.watch(filtersProvider);
    final tasks = ref.watch(tasksProvider);
    var displayedTasks = tasks;

    if (displaySetting == DisplaySetting.done) {
      displayedTasks = tasks.where((task) => task.isCompleted).toList();
    } else if (displaySetting == DisplaySetting.notDone) {
      displayedTasks = tasks.where((task) => !task.isCompleted).toList();
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: List<DragTarget<int>>.generate(displayedTasks.length, (
          index,
        ) {
          return DragTarget<int>(
            onAcceptWithDetails: (details) {
              ref
                  .read(tasksProvider.notifier)
                  .reorderTasks(details.data, index);
            },
            builder: (context, candidateData, rejectedData) {
              return Draggable<int>(
                data: index,
                feedback: TaskItem(
                  key: ValueKey(displayedTasks[index].id),
                  index,
                  task: displayedTasks[index],
                ),
                childWhenDragging: Opacity(
                  opacity: 0.5,
                  child: TaskItem(
                    key: ValueKey(displayedTasks[index].id),
                    index,
                    task: displayedTasks[index],
                  ),
                ),

                child: TaskItem(
                  key: ValueKey(displayedTasks[index].id),
                  index,
                  task: displayedTasks[index],
                ),
              );
            },
          );
        }),

        // spacing: 18,
        // children: List<TaskItem>.generate(displayedTasks.length, (index) {
        //   return TaskItem(
        //     key: ValueKey(displayedTasks[index].id),
        //     index,
        //     task: displayedTasks[index],
        //   );
        // }),
      ),
    );
  }
}
