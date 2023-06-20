import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_proj/presentation/todo/todo_prov/todo_detail/todo_detail_prov_controller.dart';
import 'package:flutter_demo_proj/presentation/todo/todo_prov/todo_detail/todo_prov_detail_state.dart';
import 'package:flutter_demo_proj/presentation/todo/todo_prov/todo_list/todo_list_state.dart';
import 'package:flutter_demo_proj/presentation/todo/todo_prov/todo_list/todo_lits_controller.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import 'app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<TodoDetailProVController, TodoDetailProVState>(
            create: (_) => TodoDetailProVController()),
        StateNotifierProvider<TodoListProVController, TodoListProVState>(
            create: (_) => TodoListProVController()),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
