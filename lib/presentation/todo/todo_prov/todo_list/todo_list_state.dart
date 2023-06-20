import '../../../../domain/entity/todo_entity.dart';

class TodoListProVState {
  final List<TodoEntity> todoList;

  TodoListProVState({required this.todoList});

  copyWith({required List<TodoEntity> tl}) {
    return TodoListProVState(todoList: tl);
  }
}
