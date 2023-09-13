import 'package:flutter/material.dart';
import "package:list_todo_beta/models/todo.dart";
import 'package:list_todo_beta/widgets/todo_list/todo_item.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<Todo> _todos = <Todo>[];
  final _textFieldController = TextEditingController();

  void _addTodoItem(String name) {
    setState(() {
      _todos.add(Todo(name: name, completed: false));
    });
    _textFieldController.clear();
  }

  void _handleTodoChange(Todo todo) {
    setState(() {
      todo.completed = !todo.completed;
    });
  }

  void _deleteTodo(Todo todo) {
    setState(() {
      _todos.removeWhere((element) => element.name == todo.name);
    });
  }

  void _showModalDialog() {
    showDialog(
        context: context,
        builder: (cxt) {
          return AlertDialog(
            title: const Text('Add a Todo'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: "Type a todo"),
              autofocus: true,
            ),
            actions: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  if(_textFieldController.text == "") {
                    return;
                  }
                  _addTodoItem(_textFieldController.text);
                  Navigator.pop(context);
                },
                child: const Text("Add"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
        actions: [
          IconButton(
            onPressed: _showModalDialog,
            tooltip: "Add a Todo",
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: _todos.map((Todo todo) {
          return TodoItem(
            todo: todo,
            onTodoChanged: _handleTodoChange,
            removeTodo: _deleteTodo,
          );
        }).toList(),
      ),
    );
  }
}
