import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider_learn/models/item.dart';
import 'package:todo_app_provider_learn/models/todo.dart';
import 'package:todo_app_provider_learn/provider/todo_provider.dart';
import 'package:todo_app_provider_learn/widgets/todo_list.dart';

class AddItem extends StatefulWidget {
  Item item;
  AddItem({Key? key, required this.item}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final taskControl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  //init
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TodoProvider>(context, listen: false).initSharePreferences();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Todo List',
                style: TextStyle(color: Colors.purple, fontSize: 20.0),
              ),
              TodoList(title: widget.item.title),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SingleChildScrollView(
                          child: AlertDialog(
                            title: const Text('Add Todo'),
                            content: SizedBox(
                              height: MediaQuery.of(context).size.height / 8,
                              child: Form(
                                key: formKey,
                                child: Column(children: [
                                  TextFormField(
                                    autofocus: true,
                                    controller: taskControl,
                                    validator: (value) {
                                      if (value == '') {
                                        return "Task can''t be empty!";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Task'),
                                  )
                                ]),
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    bool validResult =
                                        formKey.currentState!.validate();
                                    if (validResult == true) {
                                      Todo todo = Todo(
                                          title: taskControl.text,
                                          category: widget.item.title);
                                      Provider.of<TodoProvider>(context,
                                              listen: false)
                                          .addTodo(todo);
                                      taskControl.text = '';
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: const Text('Add')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancel'))
                            ],
                          ),
                        );
                      });
                },
                child: const Text(
                  'ADD',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ]),
      ),
    );
  }
}
