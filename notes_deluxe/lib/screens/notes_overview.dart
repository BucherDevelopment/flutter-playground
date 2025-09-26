import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widgets/note_card.dart';

class NotesOverviewScreen extends StatelessWidget {
  const NotesOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GridView.builder(
        padding: const EdgeInsets.only(bottom: 16, left: 8, right: 8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: 1.1,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: dummyNotes.length,
        itemBuilder: (ctx, idx) {
          return NoteCard(note: dummyNotes[idx]);
        },
      ),
    );
  }
}
