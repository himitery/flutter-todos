import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todos/todo/todo_home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Todos",
      darkTheme: ThemeData(
        primaryColor: Colors.orange[700],
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: TodoHome(),
    );
  }
}
