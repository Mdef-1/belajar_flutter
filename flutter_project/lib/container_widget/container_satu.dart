import 'package:flutter/material.dart';
import 'package:flutter_project/main_layout.dart';

class ContainerSatu extends StatelessWidget {
  const ContainerSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Container Satu',
      body: Container(
        margin: EdgeInsets.only(top: 10),
        color: Colors.blue,
        width: 200,
        height: 200,
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.all(0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Text'),
            ),
        ),
      )
    );
  }
}
