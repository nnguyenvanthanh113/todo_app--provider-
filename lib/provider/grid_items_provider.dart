import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_provider_learn/models/item.dart';
import 'package:todo_app_provider_learn/widgets/shared_pref_helper.dart';

class GirdItems with ChangeNotifier {
  List<Item> categories = [
    Item(title: 'Home'),
    Item(title: 'School'),
    Item(title: 'Work'),
  ];

  late SharedPreferences sharedPreferences;
  UnmodifiableListView<Item> get allcategories =>
      UnmodifiableListView(categories);

  //add category
  void addCategorize(Item item) {
    categories.add(item);
    saveDataToLocalStorage();
  }

  //delete category
  void deleteCategoriez(Item item) {
    categories.remove(item);
    updateDataToLocalStorage();
    notifyListeners();
  }

  //
  void intiSharedPreferences() async {
    await SharePreferencesHelper.init();
    sharedPreferences = SharePreferencesHelper.instance;
    loadDataFromLocalStorage();
    notifyListeners();
  }

  //save data to localstorage
  void saveDataToLocalStorage() {
    List<String>? spList =
        categories.map((item) => json.encode(item.toMap())).toList();
    // sharedPreferences!.setStringList('categoryList', spList);
    sharedPreferences.setStringList('categoryList', spList);
  }

  //update data to local storage
  void updateDataToLocalStorage() {
    //sharedPreferences!.remove('categoryList');
    sharedPreferences.remove('categoryList');
    saveDataToLocalStorage();
  }

  //load data to local storage
  void loadDataFromLocalStorage() {
    // List<String>? spList = sharedPreferences!.getStringList('categorylist');
    List<String>? spList = sharedPreferences.getStringList('categorylist');
    if (spList != null) {
      categories =
          spList.map((item) => Item.fromMap(json.decode(item))).toList();
    }
  }
}
