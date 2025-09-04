import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_dashboard_01/models/note.dart';
import 'package:notes_dashboard_01/providers/notes_provider.dart';
import 'package:notes_dashboard_01/widgets/note_item.dart';

class NotesDashboard extends ConsumerStatefulWidget {
  const NotesDashboard({super.key});
  @override
  ConsumerState<NotesDashboard> createState() => _NotesDashboardState();
}

class _NotesDashboardState extends ConsumerState<NotesDashboard> {
  @override
  Widget build(BuildContext context) {
    List<Note> notes = ref.watch(notesProvider);

    return Stack(children: notes.map((note) => NoteItem(note: note)).toList());
  }
}
