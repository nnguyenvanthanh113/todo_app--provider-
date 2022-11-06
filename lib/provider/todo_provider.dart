import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_provider_learn/models/todo.dart';
import 'package:todo_app_provider_learn/widgets/shared_pref_helper.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> todos = [];

  SharedPreferences? sharedPreferences;

  UnmodifiableListView<Todo> get alltodos => UnmodifiableListView(todos);

  //todo
  void addTodo(Todo todo) {
    todos.add(todo);
    saveDataToLocalStorage();
    notifyListeners();
  }

  //remove todo
  void removeTodo(Todo todo) {
    todos.remove(todo);
    updateDateToLocalStorage();
    notifyListeners();
  }

  //sp methods
  void initSharePreferences() async {
    await SharePreferencesHelper.init();
    sharedPreferences = SharePreferencesHelper.instance;
    loadDataFromLocalStorage();
    notifyListeners();
  }

  //save data to local storage
  void saveDataToLocalStorage() {
    List<String>? spList =
        todos.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences!.setStringList('list', spList);
  }

  //load data
  void loadDataFromLocalStorage() {
    List<String>? spList = sharedPreferences!.getStringList('list');
    if (spList != null) {
      todos = spList.map((item) => Todo.fromMap(json.decode(item))).toList();
    }
  }

  //update data to local storage
  void updateDateToLocalStorage() {
    sharedPreferences!.remove('list');
    saveDataToLocalStorage();
  }
}
