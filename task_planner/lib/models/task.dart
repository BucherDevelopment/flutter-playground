import 'package:cloud_firestore/cloud_firestore.dart';

enum Priority { high, medium, low }

class Task {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final Priority priority;

  const Task({
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    this.isCompleted = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'priority': priority.toString(),
    };
  }

  factory Task.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Task(
      id: doc.id,
      title: data['title'],
      description: data['description'],
      isCompleted: data['isCompleted'],
      priority: Priority.values.firstWhere(
        (e) => e.toString() == data['priority'],
      ),
    );
  }

  Task copyWith({
    String? id,
    String? title,
    String? description,
    Priority? priority,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
