import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todos/todo/controller/todo_item_controller.dart';
import 'package:todos/todo/interfaces/todo_item.dart';

class TodoItemList extends GetView<TodoItemController> {
  final bool isChecked;

  const TodoItemList({Key? key, required this.isChecked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: const BoxDecoration(
          color: Color(0xFF292929),
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 10,
                ),
                child: Text(
                  "완료",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              visible: isChecked,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: controller.todoItems
                  .where((element) => element.isChecked == isChecked)
                  .length,
              itemBuilder: (_, int index) {
                TodoItem item = controller.todoItems
                    .where((element) => element.isChecked == isChecked)
                    .toList()[index];

                return Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.checkItem(item.key);
                      },
                      icon: Icon(
                        item.isChecked
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                      ),
                    ),
                    Text(
                      item.content,
                      style: TextStyle(
                        fontWeight:
                            item.isChecked ? FontWeight.w400 : FontWeight.w700,
                        color: item.isChecked ? Colors.grey[600] : Colors.white,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
