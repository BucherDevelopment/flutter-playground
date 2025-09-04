import 'package:flutter/material.dart';
import 'package:notes_dashboard_01/models/note.dart';

class NoteItem extends StatefulWidget {
  const NoteItem({super.key, required this.note});

  final Note note;

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  @override
  Widget build(BuildContext context) {
    final note = widget.note;
    return Positioned(
      left: note.position.dx,
      top: note.position.dy,
      child: Draggable<Note>(
        data: note,
        feedback: Material(
          // Feedback wird während des Drag-Vorgangs angezeigt
          elevation: 6.0,
          child: noteCard(note),
        ),
        childWhenDragging:
            Container(), // Platzhalter, wenn die Notiz gezogen wird
        onDraggableCanceled: (velocity, offset) {
          setState(() {
            // Position der Notiz an die neue Stelle anpassen
            note.position = offset;
          });
        },
        child: noteCard(note),
      ),
    );
  }

  Widget noteCard(Note note) {
    return Card(
      color: Colors.yellow[200],
      child: Container(
        width: 150,
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(note.title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            // Hier wird ein TextField angezeigt, das den Beschreibungstext zeigt
            TextField(
              controller: TextEditingController(text: note.description),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Beschreibung',
              ),
              maxLines: 3,
              onChanged: (value) {
                note.description = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
