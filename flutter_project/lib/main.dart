import 'package:flutter/material.dart';
import 'package:flutter_project/Ujian/bundle_screen.dart';
import 'package:flutter_project/catalog_product/catalog.dart';
import 'package:flutter_project/form_widget/input_screen.dart';
import 'package:flutter_project/main_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Bundle(),
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
        child: Text(
          'Hello, Flutter',
          style: TextStyle(
            fontSize: 40,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}
