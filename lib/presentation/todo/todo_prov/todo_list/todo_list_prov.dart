import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_proj/app_router.gr.dart';
import 'package:flutter_demo_proj/presentation/todo/todo_prov/todo_list/todo_list_state.dart';
import 'package:flutter_demo_proj/presentation/todo/todo_prov/todo_list/todo_lits_controller.dart';
import 'package:provider/provider.dart';

import '../../../../domain/entity/todo_entity.dart';

@RoutePage()
class TodoListProv extends StatelessWidget {
  const TodoListProv({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 22),
        centerTitle: true,
        backgroundColor: const Color(0xFF6750A4),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Selector<TodoListProVState, List<TodoEntity>>(
          selector: (_, value) => value.todoList,
          builder: (context, data, child) => ListView.separated(
              itemBuilder: (_, int index) {
                return TodoItem(
                  todoEntity: data[index],
                  onClickEdit: () async {
                    var todo = await context.router.push<TodoEntity>(
                        TodoDetailProvider(
                            todoEntity: data[index],
                            title: 'Edit Todo',
                            buttonLabel: 'Save'));
                    if (todo == null) {
                      return;
                    }
                    if (context.mounted) {
                      context
                          .read<TodoListProVController>()
                          .editTodo(index: index, todoEntity: data[index]);
                    }
                  },
                  onClickRemove: () {
                    context
                        .read<TodoListProVController>()
                        .onRemove(data[index]);
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 10),
              itemCount: data.length),
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(right: 12, bottom: 16),
        child: FloatingActionButton(
          onPressed: () async {
            var newTodo = await context.router.push<TodoEntity>(
                TodoDetailProvider(title: 'Add Todo', buttonLabel: 'Add'));
            if (newTodo == null) {
              return;
            }
            if (context.mounted) {
              context.read<TodoListProVController>().onAddTodo(newTodo);
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class TodoItem extends StatelessWidget {
  const TodoItem(
      {super.key,
      required this.todoEntity,
      required this.onClickRemove,
      required this.onClickEdit});

  final TodoEntity todoEntity;
  final VoidCallback onClickRemove;
  final VoidCallback onClickEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFEF7FF),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(todoEntity.priority.value,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey)),
              const SizedBox(height: 5),
              Text(todoEntity.title,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey)),
              const SizedBox(height: 5),
              Text(todoEntity.description,
                  style: const TextStyle(fontSize: 12)),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                  child: const Icon(Icons.edit), onTap: () => {onClickEdit()}),
              const SizedBox(width: 10),
              GestureDetector(
                child: const Icon(Icons.delete),
                onTap: () => {onClickRemove()},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
