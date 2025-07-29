import 'package:flutter/material.dart';
import 'package:flutter_project/main_layout.dart';

class ColumnOne extends StatelessWidget {
  const ColumnOne({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: 'Column',
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Text Widget 1'),
            Text('Text Widget 2'),
            Text('Text Widget 3'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Text Widget 1'),
                Text('Text Widget 2'),
                Text('Text Widget 3'),
              ],
            )
          ],
        ));
  }
}
