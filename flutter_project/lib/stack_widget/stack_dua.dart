import 'package:flutter/material.dart';

class StackTwo extends StatelessWidget {
  const StackTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 200,
          color: Colors.blue,
        ),
        Positioned(
          top: 20,
          left: 30,
          child: Icon(
            Icons.star,
            size: 30,
            color: Color.fromARGB(255, 255, 72, 0),
          ),
        ),
        Positioned(
          top: 120,
          left: 130,
          child: Icon(
            Icons.star,
            size: 30,
            color: Color.fromARGB(255, 255, 72, 0),
          ),
        ),
        Positioned(
          top: 20,
          left: 130,
          child: Icon(
            Icons.star,
            size: 30,
            color: Color.fromARGB(255, 255, 72, 0),
          ),
        ),
        Positioned(
          top: 70,
          left: 80,
          child: Icon(
            Icons.star,
            size: 30,
            color: Color.fromARGB(255, 255, 72, 0),
          ),
        ),
        Positioned(
          top: 120,
          left: 30,
          child: Icon(
            Icons.star,
            size: 30,
            color: Color.fromARGB(255, 255, 72, 0),
          ),
        ),
      ],
    );
  }
}
