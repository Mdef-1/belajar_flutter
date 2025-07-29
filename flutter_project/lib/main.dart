import 'package:flutter/material.dart';
import 'package:flutter_project/main_layout.dart';
import 'package:flutter_project/stack_widget/stack_dua.dart';
import 'package:flutter_project/stack_widget/stack_satu.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: StackTwo(),
    );
  }
}

class HelloFultter extends StatelessWidget {
  const HelloFultter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Belajar Flutter',
      body: Center(
        child: Text('Hello, Flutter',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}