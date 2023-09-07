import 'package:flutter/material.dart';
import 'package:list_todo_beta/widgets/todo_list/todo_list.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(context) {
    return const MaterialApp(
      home: TodoList(),
    );
  }
}
