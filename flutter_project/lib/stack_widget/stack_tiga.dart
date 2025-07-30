import 'package:flutter/material.dart';
import 'package:flutter_project/main_layout.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Image with Stack', 
      body: Stack(
        children: [
        ],
      ),
    );
  }
}