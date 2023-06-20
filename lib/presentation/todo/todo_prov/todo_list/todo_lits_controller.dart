import 'package:flutter_demo_proj/domain/entity/todo_entity.dart';
import 'package:flutter_demo_proj/presentation/todo/todo_prov/todo_list/todo_list_state.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class TodoListProVController extends StateNotifier<TodoListProVState> {
  TodoListProVController() : super(TodoListProVState(todoList: []));

  void onAddTodo(TodoEntity todoEntity) async {
    var l = List.of(state.todoList);
    l.add(todoEntity);
    state = await state.copyWith(tl: l);
  }

  void editTodo({required int index, required TodoEntity todoEntity}) {
    var l = List.of(state.todoList);
    l[index] = todoEntity;
    state = state.copyWith(tl: l);
  }

  void onRemove(TodoEntity todoEntity) {
    var l = List.of(state.todoList);
    l.remove(todoEntity);
    state = state.copyWith(tl: l);
  }
}
