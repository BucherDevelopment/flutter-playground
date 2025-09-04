class Task {
  final String id;
  final String title;
  final String? description;
  final DateTime untilDate;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.untilDate,
    this.description,
    this.isCompleted = false,
  });
}
