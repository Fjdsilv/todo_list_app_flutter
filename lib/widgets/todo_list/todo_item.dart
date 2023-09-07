import 'package:flutter/material.dart';
import 'package:list_todo_beta/models/todo.dart';

class TodoItem extends StatelessWidget {
  TodoItem({
    required this.todo,
    required this.onTodoChanged,
    required this.removeTodo,
  }) : super(key: ObjectKey(todo));

  final Todo todo;
  final void Function(Todo todo) onTodoChanged;
  final void Function(Todo todo) removeTodo;

  @override
  Widget build(context) {
    return ListTile(
      onTap: () {},
      leading: Checkbox(
        value: todo.completed,
        onChanged: (value) {
          onTodoChanged(todo);
        },
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(todo.name),
          ),
          IconButton(
            onPressed: () {
              removeTodo(todo);
            },
            iconSize: 35,
            icon: const Icon(
              Icons.clear_rounded,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
