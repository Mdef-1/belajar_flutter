import 'package:flutter/material.dart';
import 'package:flutter_project/main_layout.dart';

class NewsItem {
  final String title;
  final String description;
  final String imageUrl;

  const NewsItem({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  final List<NewsItem> news = const [
    NewsItem(
      title: 'Peningkatan Teknologi AI',
      description: 'AI semakin berkembang pesat dengan kemampuan kreatif dan analitik.',
      imageUrl: 'https://picsum.photos/id/1015/260/180',
    ),
    NewsItem(
      title: 'Flutter Menjadi Favorit Dev Mobile',
      description: 'Flutter memudahkan pembuatan aplikasi mobile lintas platform.',
      imageUrl: 'https://picsum.photos/id/1016/260/180',
    ),
    NewsItem(
      title: 'Keamanan Siber Meningkat',
      description: 'Perusahaan mulai fokus pada keamanan data di dunia digital.',
      imageUrl: 'https://picsum.photos/id/1019/260/180',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'News Card',
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Center(
          child: Wrap(
            spacing: 30,
            runSpacing: 20,
            children: news.map((item) {
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                  width: 260,
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.network(
                          item.imageUrl,
                          width: 260,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
                        child: Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding( 
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          item.description,
                          style: const TextStyle(fontSize: 13, color: Color.fromARGB(255, 189, 189, 189)),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}