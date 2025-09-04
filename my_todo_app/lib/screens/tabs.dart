import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo_app/providers/tasks_provider.dart';
import 'package:my_todo_app/screens/new_task.dart';
import 'package:my_todo_app/screens/task_overview.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      debugPrint('Selected index: $_selectedPageIndex');
    });
  }

  @override
  Widget build(BuildContext context) {
    final displayedTasks = ref.watch(tasksProvider);
    String displayedTitle = 'All Tasks';

    Widget activePage = TaskOverviewScreen(tasks: displayedTasks);

    if (_selectedPageIndex == 1) {
      activePage = TaskOverviewScreen(
        tasks: displayedTasks.where((task) => !task.isCompleted).toList(),
      );
      displayedTitle = 'To Do';
    }
    if (_selectedPageIndex == 2) {
      activePage = TaskOverviewScreen(
        tasks: displayedTasks.where((task) => task.isCompleted).toList(),
      );
      displayedTitle = 'Done';
    }
    return Scaffold(
      appBar: AppBar(title: Text(displayedTitle)),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Theme.of(context).colorScheme.secondary,
        onTap: (index) {
          _selectPage(index);
        },
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'All Tasks'),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outline_blank),
            label: 'To Do',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'Done'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => NewTaskScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
