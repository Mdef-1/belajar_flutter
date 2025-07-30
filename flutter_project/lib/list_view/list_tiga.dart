import 'package:flutter/material.dart';
import 'package:flutter_project/main_layout.dart';

// Dummy ArticleDetailScreen (kamu bisa ubah isinya nanti)
class ArticleDetailScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const ArticleDetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(data['partai'] ?? 'Detail')),
      body: Center(
        child: Text('Detail untuk ${data['partai']}'),
      ),
    );
  }
}

class ListTiga extends StatelessWidget {
  const ListTiga({super.key});

  static const List<Map<String, dynamic>> items = [
    {
      'partai': 'Partai Banteng',
      'title': 'Kekuatan Merah',
      'image': 'https://picsum.photos/100/120?random=1'
    },
    {
      'partai': 'Partai Solid',
      'title': 'Solidaritas Nasional',
      'image': 'https://picsum.photos/100/120?random=2'
    },
    {
      'partai': 'Partai Joged',
      'title': 'Langkah Demokrasi',
      'image': 'https://picsum.photos/100/120?random=3'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Article Screen',
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ArticleDetailScreen(data: item),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(14),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(item['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: NetworkImage(item['image']),
                            height: 100, // Opsional: bisa kamu sesuaikan
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            item['title'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
