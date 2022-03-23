import 'package:get/get.dart';

import '../interfaces/todo_item.dart';

class TodoItemController extends GetxController {
  RxList<TodoItem> todoItems = RxList();

  addItem(TodoItem item) {
    todoItems.add(item);
    todoItems.sort((prev, next) => next.date.compareTo(prev.date));
  }

  updateItem(TodoItem item) {
    if (todoItems.firstWhereOrNull((element) => element.key == item.key) !=
        null) {
      todoItems.removeWhere((element) => element.key == item.key);
      todoItems.add(item);
      todoItems.sort((prev, next) => next.date.compareTo(prev.date));
    }
  }

  deleteItem(String key) {
    todoItems.removeWhere((element) => element.key == key);
  }

  checkItem(String key) {
    int index = todoItems.indexWhere((element) => element.key == key);
    TodoItem item = todoItems[index];
    item.isChecked = !item.isChecked;
    todoItems[index] = item;
  }
}
