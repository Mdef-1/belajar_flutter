import 'package:flutter/material.dart';
import 'package:flutter_project/main_layout.dart';

class RowOne extends StatelessWidget {
  const RowOne({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Row',
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Text Widget 1'),
          Text('Text Widget 2'),
          Text('Text Widget 3'),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Column Text 1'),
              Text('Column Text 2'),
              Text('Column Text 3'),
            ],
          ),
        ],
      ),
    );
  }
}
