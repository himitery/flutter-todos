import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../interfaces/todo_item.dart';

class TodoItemController extends GetxController {
  RxList<TodoItem> todoItems = RxList();

  @override
  void onInit() async {
    final prefs = await SharedPreferences.getInstance();

    todoItems.addAll(prefs
            .getStringList('todoItems')
            ?.map((element) => TodoItem.fromJson(jsonDecode(element))) ??
        []);

    super.onInit();
  }

  addItem(TodoItem item) {
    todoItems.add(item);
    todoItems.sort((prev, next) => next.date.compareTo(prev.date));
    _saveItemToLocalStorage();
  }

  updateItem(TodoItem item) {
    if (todoItems.firstWhereOrNull((element) => element.key == item.key) !=
        null) {
      todoItems.removeWhere((element) => element.key == item.key);
      todoItems.add(item);
      todoItems.sort((prev, next) => next.date.compareTo(prev.date));
      _saveItemToLocalStorage();
    }
  }

  deleteItem(String key) {
    todoItems.removeWhere((element) => element.key == key);
    _saveItemToLocalStorage();
  }

  checkItem(String key) {
    int index = todoItems.indexWhere((element) => element.key == key);
    TodoItem item = todoItems[index];
    item.isChecked = !item.isChecked;
    todoItems[index] = item;
    _saveItemToLocalStorage();
  }

  _saveItemToLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setStringList("todoItems",
        todoItems.map((element) => jsonEncode(element.toJson())).toList());
  }
}
