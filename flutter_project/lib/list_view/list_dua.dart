import 'package:flutter/material.dart';
import 'package:flutter_project/main_layout.dart';

class ListDua extends StatelessWidget {
  const ListDua({super.key});

  final List<Map<String, dynamic>> items = const [
    {'color': Colors.redAccent, 'partai': 'Partai Banteng'},
    {'color': Colors.amberAccent, 'partai': 'Partai Solid'},
    {'color': Colors.blueAccent, 'partai': 'Partai Joged'},
  ];

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'List Builder',
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            color: item['color'],
            width: 200,
            height: 200,
            margin: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                item['partai'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}