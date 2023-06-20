import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_proj/domain/entity/todo_entity.dart';
import 'package:flutter_demo_proj/presentation/todo/todo_components/todo_dropdown.dart';
import 'package:flutter_demo_proj/presentation/todo/todo_prov/todo_detail/todo_detail_prov_controller.dart';
import 'package:flutter_demo_proj/presentation/todo/todo_prov/todo_detail/todo_prov_detail_state.dart';
import 'package:provider/provider.dart';

import '../../../../domain/enum/priority.dart';

@RoutePage<TodoEntity>()
class TodoDetailProvider extends StatefulWidget {
  const TodoDetailProvider(
      {super.key,
      this.todoEntity,
      this.title = "AddTodo",
      this.buttonLabel = "Add"});

  final TodoEntity? todoEntity;
  final String title;
  final String buttonLabel;

  @override
  State<TodoDetailProvider> createState() => _TodoDetailProviderState();
}

class _TodoDetailProviderState extends State<TodoDetailProvider> {
  final titleController = TextEditingController();

  final descriptionController = TextEditingController();

  @override
  void initState() {
    final state = Provider.of<TodoDetailProVController>(context, listen: false);

    setState(() {
      state.onUpdatePriority(widget.todoEntity?.priority ?? Priority.high);

      state.onUpdateDescription(widget.todoEntity?.description ?? '');

      state.onUpdateTitle(widget.todoEntity?.title ?? '');

      titleController.text = widget.todoEntity?.title ?? "";

      descriptionController.text = widget.todoEntity?.description ?? "";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 22),
        centerTitle: true,
        backgroundColor: const Color(0xFF6750A4),
        leading: GestureDetector(
            onTap: () => {context.router.pop()},
            child: const Icon(Icons.arrow_back)),
      ),
      body: Consumer<TodoDetailProVState>(
        builder: (context, state, ___) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  child: TodoDropDown<Priority>(
                      getLabel: (Priority value) => value.value,
                      value: state.priority,
                      onChanged: (Priority? value) {
                        if (value == null) {
                          return;
                        }
                        context
                            .read<TodoDetailProVController>()
                            .onUpdatePriority(value);
                      },
                      options: Priority.values),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 60,
                  child: TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      labelText: 'Title',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    onChanged: (String? value) {
                      if (value == null) {
                        return;
                      }
                      context
                          .read<TodoDetailProVController>()
                          .onUpdateTitle(value);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 60,
                  child: TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      labelText: 'Description',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    onChanged: (String? value) {
                      if (value == null) {
                        return;
                      }
                      context
                          .read<TodoDetailProVController>()
                          .onUpdateDescription(value);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        child: ElevatedButton(
          onPressed: () {
            var st = context.read<TodoDetailProVState>();
            var todBack = TodoEntity(
                priority: st.priority,
                title: st.title,
                description: st.description);
            context.router.pop<TodoEntity>(todBack);
            context.read<TodoDetailProVController>().onResetTodo();
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xFF6750A4)),
          ),
          child: Text(
            widget.buttonLabel,
            style: const TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
