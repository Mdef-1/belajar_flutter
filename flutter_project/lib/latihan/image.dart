import 'package:flutter/material.dart';
import 'package:flutter_project/main_layout.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Kombinasi Widget',
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Stack(
                  children: [
                    Image.network(
                      'https://picsum.photos/250?image=9',
                      width: 400,
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: 400,
                      height: 400,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    // Play icon di pojok kiri dalam gambar
                    Positioned(
                      left: 16,
                      top: 330,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          shape: BoxShape.circle,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}