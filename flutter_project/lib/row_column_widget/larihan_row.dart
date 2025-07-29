import 'package:flutter/material.dart';
import 'package:flutter_project/main_layout.dart';

class RowSatu extends StatelessWidget {
  const RowSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'latihan Row',
      body: Center(
        child: Container(
          height: 120,
          width: double.infinity,
          color: Colors.blueAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.navigation, color: Colors.white),
                  SizedBox(height: 8),
                  Text('Navigation', style: TextStyle(color: Colors.white)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.white),
                  SizedBox(height: 8),
                  Text('Star', style: TextStyle(color: Colors.white)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home, color: Colors.white),
                  SizedBox(height: 8),
                  Text('Home', style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
