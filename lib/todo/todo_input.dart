import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todos/todo/controller/todo_item_controller.dart';
import 'package:todos/todo/interfaces/todo_item.dart';
import 'package:uuid/uuid.dart';

class TodoInput extends StatefulWidget {
  const TodoInput({Key? key}) : super(key: key);

  @override
  State<TodoInput> createState() => _TodoInputState();
}

class _TodoInputState extends State<TodoInput> {
  final controller = Get.put(TodoItemController());

  String content = "";

  void addTodo() {
    if (content.isNotEmpty) {
      TodoItem todoItem =
          TodoItem(const Uuid().v4(), content, DateTime.now(), false);
      controller.addItem(todoItem);
    }

    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Form(
            child: TextField(
              keyboardType: TextInputType.text,
              autofocus: true,
              cursorColor: Theme.of(context).primaryColor,
              onChanged: (String text) {
                setState(() {
                  content = text;
                });
              },
              onSubmitted: (_) {
                addTodo();
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF292929),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.arrow_circle_up),
                  onPressed: () {
                    addTodo();
                  },
                  color: Theme.of(context).primaryColor,
                ),
              ),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
