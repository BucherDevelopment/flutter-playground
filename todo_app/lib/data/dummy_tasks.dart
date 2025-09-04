import '../models/task.dart';

final dummyTasks = [
  Task(
    id: '1',
    title: 'Einkaufen',
    description: 'Milch, Brot, Eier kaufen',
    untilDate: DateTime.now().add(Duration(days: 1)),
  ),
  Task(
    id: '2',
    title: 'Workout',
    description: '30 Minuten Joggen',
    untilDate: DateTime.now().add(Duration(days: 2)),
  ),
  Task(
    id: '3',
    title: 'Lesen',
    description: 'Kapitel 5 im Buch lesen',
    untilDate: DateTime.now().add(Duration(days: 3)),
  ),
  Task(
    id: '4',
    title: 'Projektarbeit',
    description: 'Flutter App weiterentwickeln',
    isCompleted: true,
    untilDate: DateTime.now().add(Duration(days: 4)),
  ),
];
