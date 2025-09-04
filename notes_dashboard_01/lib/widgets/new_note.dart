import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_dashboard_01/providers/notes_provider.dart';

class NewNote extends ConsumerStatefulWidget {
  const NewNote({super.key});

  @override
  ConsumerState<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends ConsumerState<NewNote> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _saveNote() {
    final _enteredTitle = _titleController.text;
    if (_enteredTitle.isEmpty) {
      return;
    }
    ref.read(notesProvider.notifier).addNote(_enteredTitle);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Text('Notiz erstellen'),
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: 'Titel'),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('abbrechen')),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    _saveNote();
                  },
                  child: Text('Notiz erstellen'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
