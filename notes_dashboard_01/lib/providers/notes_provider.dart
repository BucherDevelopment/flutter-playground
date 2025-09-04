import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_dashboard_01/models/note.dart';

class NotesNotifier extends StateNotifier<List<Note>> {
  NotesNotifier()
    : super([
        Note(
          title: "Notiz 1",
          description: "Beschreibung der Notiz 1",
          position: Offset(50, 100),
        ),
      ]);

  void addNote(String title) {
    final newNote = Note(
      title: title,
      description: 'new',
      position: Offset(0, 0),
    );
    state = [...state, newNote];
  }
}

final notesProvider = StateNotifierProvider<NotesNotifier, List<Note>>((ref) {
  return NotesNotifier();
});
