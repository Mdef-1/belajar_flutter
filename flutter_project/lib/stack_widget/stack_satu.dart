import 'package:flutter/material.dart';
import 'package:flutter_project/main_layout.dart';

class StackOne extends StatelessWidget {
  const StackOne({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Belajar Stack',
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(width: 200, height: 200, color: Colors.red),
          Container(width: 200, height: 200, color: Colors.green),
          Container(
              width: 200, height: 200, color: Color.fromARGB(255, 200, 255, 0)),
        ],
      ),
    );
  }
}
