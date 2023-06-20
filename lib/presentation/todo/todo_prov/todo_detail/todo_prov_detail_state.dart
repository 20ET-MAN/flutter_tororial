
import '../../../../domain/enum/priority.dart';

class TodoDetailProVState {
  final String title;
  final String description;
  final Priority priority;

  TodoDetailProVState(
      {required this.title, required this.description, required this.priority});

  copyWith(String? title, String? description, Priority? priority) {
    return TodoDetailProVState(
        title: title ?? this.title,
        description: description ?? this.description,
        priority: priority ?? this.priority);
  }
}
