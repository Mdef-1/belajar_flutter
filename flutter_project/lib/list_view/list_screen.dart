import 'package:flutter/material.dart';
import 'package:flutter_project/main_layout.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({super.key, required this.data});
  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: data['title'] ?? 'No Title',
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            if (data['image'] != null)
              Image.network(data['image']!, height: 200)
            else
              const Text('No image provided'),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                data['description'] ?? 'No description',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}