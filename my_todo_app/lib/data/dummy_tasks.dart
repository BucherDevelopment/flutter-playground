import 'package:my_todo_app/models/task.dart';

List<Task> dummyTasks = [
  Task(
    id: 't1',
    title: 'Buy groceries',
    description: 'Buy milk, bread, and eggs',
    isCompleted: true,
  ),
  Task(
    id: 't2',
    title: 'Clean the house',
    description: 'Vacuum and dust the house',
    isCompleted: false,
  ),
  Task(
    id: 't3',
    title: 'Do laundry',
    description: 'Wash and fold clothes',
    isCompleted: true,
  ),
  Task(
    id: 't4',
    title: 'Walk the dog',
    description: 'Take the dog for a walk',
    isCompleted: false,
  ),
  Task(
    id: 't5',
    title: 'Water the plants',
    description: 'Water the indoor and outdoor plants',
    isCompleted: true,
  ),
];

void completeTask(String id, bool isCompleted) {
  final taskIndex = dummyTasks.indexWhere((task) => task.id == id);
  dummyTasks[taskIndex].isCompleted = isCompleted;
}
