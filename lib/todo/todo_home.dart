import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todos/todo/controller/todo_item_controller.dart';
import 'package:todos/todo/todo_input.dart';

import 'interfaces/todo_item_list.dart';

class TodoHome extends StatelessWidget {
  TodoHome({Key? key}) : super(key: key);

  final controller = Get.put(TodoItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Todos"),
        titleTextStyle: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
            children: const [
              TodoItemList(
                isChecked: false,
              ),
              SizedBox(
                height: 12,
              ),
              TodoItemList(
                isChecked: true,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return const TodoInput();
            },
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
