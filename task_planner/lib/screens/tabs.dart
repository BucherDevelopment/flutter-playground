import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_planner/screens/task_overview.dart';
import 'package:task_planner/widgets/main_drawer.dart';
import 'package:task_planner/widgets/new_task.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Overview', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      drawer: MainDrawer(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            // isScrollControlled: true,
            builder: (ctx) {
              return NewTask();
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: TaskOverviewScreen(),
    );
  }
}
