import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/providers/tasks_provider.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/screens/new_task_screen.dart';
import 'package:todo_app/widgets/main_drawer.dart';
import 'package:todo_app/widgets/task_list.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _startAddNewTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const NewTaskScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Task> unfinishedTasks = ref
        .watch(tasksProvider)
        .where((task) => !task.isCompleted)
        .toList();
    List<Task> finishedTasks = ref
        .watch(tasksProvider)
        .where((task) => task.isCompleted)
        .toList();

    Widget activePage;
    if (_selectedIndex == 1) {
      unfinishedTasks.isEmpty
          ? activePage = Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'All tasks are done!',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _startAddNewTask(context);
                    },
                    child: const Text('Add Task'),
                  ),
                ],
              ),
            )
          : activePage = TaskList(tasks: unfinishedTasks);
    } else if (_selectedIndex == 2) {
      finishedTasks.isEmpty
          ? activePage = const Center(child: Text('No finished tasks'))
          : activePage = TaskList(tasks: finishedTasks);
    } else {
      activePage = HomeScreen();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo App', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Tasks to do'),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Finished tasks',
          ),
        ],
      ),
      drawer: MainDrawer(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startAddNewTask(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
