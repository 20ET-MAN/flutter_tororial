import '../enum/priority.dart';

class TodoEntity {
  TodoEntity({
    this.id,
    required this.priority,
    required this.title,
    required this.description,
  });

  final int? id;

  final Priority priority;
  final String title;
  final String description;
}
