import 'package:flutter_demo_proj/domain/enum/priority.dart';
import 'package:flutter_demo_proj/presentation/todo/todo_prov/todo_detail/todo_prov_detail_state.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class TodoDetailProVController extends StateNotifier<TodoDetailProVState> {
  TodoDetailProVController()
      : super(TodoDetailProVState(
      title: '', description: '', priority: Priority.high));

  void onUpdatePriority(Priority priority)async {
    state =await state.copyWith(null, null, priority);
  }

  void onUpdateTitle(String title)async {
    state = await state.copyWith(title, null, null);
  }

  void onUpdateDescription(String description)async {
    state = await state.copyWith(null, description, null);
  }

  void onResetTodo() async{
    state = await state.copyWith('', '', Priority.high);
  }
}
