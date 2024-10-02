import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '/store/store.dart';
import '/views/todo_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      // Menyediakan store Redux ke seluruh aplikasi
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To-Do List with Redux',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: TodoPage(),
      ),
    );
  }
}
