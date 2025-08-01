import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final String title;
  final Widget body;

  const MainLayout({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            letterSpacing: -1,
          ),
        ),
        centerTitle: true,
        shape: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey.withOpacity(0.4),
          ),
        ),
      ),
      body: Center(child: body),
    );
  }
}
