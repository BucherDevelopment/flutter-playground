import 'package:task_planner/models/task.dart';

final List<Task> dummyTasks = [
  Task(
    id: 't1',
    title: 'Buy groceries',
    description:
        'Milk, Bread, Eggs, Butter, Cheese, Vegetables, Fruits, and other essential items for the week.',
    isCompleted: false,
    priority: Priority.high,
  ),
  Task(
    id: 't2',
    title: 'Walk the dog',
    description:
        'Take the dog for a walk in the park, ensure to carry a water bottle and some treats for the dog.',
    isCompleted: false,
    priority: Priority.medium,
  ),
  Task(
    id: 't3',
    title: 'Homework',
    description:
        'Finish math and science assignments, review notes, and prepare for the upcoming tests.',
    isCompleted: false,
    priority: Priority.high,
  ),
  Task(
    id: 't4',
    title: 'Clean the house',
    description:
        'Vacuum and dust all rooms, clean the bathrooms, and organize the living room and kitchen.',
    isCompleted: false,
    priority: Priority.low,
  ),
  Task(
    id: 't5',
    title: 'Read a book',
    description:
        'Read at least 50 pages of a novel, take notes on important points, and reflect on the story.',
    isCompleted: false,
    priority: Priority.low,
  ),
];
