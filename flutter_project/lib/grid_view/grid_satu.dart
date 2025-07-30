import 'package:flutter/material.dart';
import 'package:flutter_project/main_layout.dart';

class GridSatu extends StatelessWidget {
  const GridSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Grid View', 
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: [
          Container(color: Colors.blue, width: 200,  child: Text('1'),),
          Container(color: Colors.red, width: 200,  child: Text('2'),),
          Container(color: Colors.green, width: 200,  child: Text('3'),),
          Container(color: Colors.yellow, width: 200,  child: Text('4'),),
        ],
      )
      );
  }
}