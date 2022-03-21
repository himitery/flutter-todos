import 'package:flutter/material.dart';

class TodoInput extends StatefulWidget {
  const TodoInput({Key? key}) : super(key: key);

  @override
  State<TodoInput> createState() => _TodoInputState();
}

class _TodoInputState extends State<TodoInput> {
  String content = "";

  void addTodo(BuildContext context) {
    Navigator.pop(context);
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
                addTodo(context);
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
                    addTodo(context);
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
