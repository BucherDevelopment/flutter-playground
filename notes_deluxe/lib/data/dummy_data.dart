import '../models/note.dart';

final List<Note> dummyNotes = [
  Note(
    id: '1',
    title: 'Einkaufsliste',
    content: 'Milch, Brot, Eier, Butter',
    createdAt: DateTime(2025, 9, 20, 10, 30),
  ),
  Note(
    id: '2',
    title: 'Meeting-Notizen',
    content:
        'Projektstatus besprechen, Aufgaben verteilen, nächste Schritte planen.',
    createdAt: DateTime(2025, 9, 22, 14, 0),
  ),
  Note(
    id: '3',
    title: 'Ideen',
    content: 'App für Notizen mit Spracherkennung entwickeln.',
    createdAt: DateTime(2025, 9, 24, 9, 15),
  ),
  Note(
    id: '4',
    title: 'Rezept',
    content: 'Pasta Carbonara: Nudeln, Speck, Eier, Parmesan, Pfeffer.',
    createdAt: DateTime(2025, 9, 18, 18, 45),
  ),
];
