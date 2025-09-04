import 'package:flutter/material.dart';
import 'package:notes_dashboard_01/widgets/new_note.dart';
import 'package:notes_dashboard_01/widgets/notes_dashboard.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notizen Dashboard',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: NotesDashboard(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (bCtx) {
              return NewNote();
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
