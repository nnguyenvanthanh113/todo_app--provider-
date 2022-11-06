import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider_learn/models/todo.dart';
import 'package:todo_app_provider_learn/provider/todo_provider.dart';

class TodoCard extends StatelessWidget {
  TodoCard({Key? key, required this.todo}) : super(key: key);
  Todo todo;
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: ((context, state, child) {
        return Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: ListTile(
            title: Text(todo.title),
            onLongPress: () {
              state.removeTodo(todo);
            },
          ),
        );
      }),
    );
  }
}
