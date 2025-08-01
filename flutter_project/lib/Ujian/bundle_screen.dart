import 'package:flutter/material.dart';
import 'package:flutter_project/main_layout.dart';
import 'package:flutter_project/Ujian/bundle_list.dart';
import 'package:flutter_project/Ujian/bundle_item.dart';

class Bundle extends StatelessWidget {
  const Bundle({super.key});

  final List<BundleItem> bundles = const [
    BundleItem(
      name: 'Ciggarettes After Sex',
      location: 'Chicago',
      date: '12/23/2007',
      description: 'Dont Forget to watch the concert!',
      imagePath: 'assets/images/cas.jpeg',
      price: 19.99,
    ),
    BundleItem(
      name: 'Maroon 5',
      location: 'New York',
      date: '12/23/2007',
      description: 'Dont Forget to watch the concert!',
      imagePath: 'assets/images/maroon-5.jpeg',
      price: 29.99,
    ),
    BundleItem(
      name: 'Coltrave',
      location: 'Tokyo',
      date: '12/23/2007',
      description: 'Dont Forget to watch the concert!',
      imagePath: 'assets/images/japan.jpg',
      price: 24.99,
    ),
    BundleItem(
      name: 'Yoasobi',
      location: 'Jakarta',
      date: '12/23/2007',
      description: 'Dont Forget to watch the concert!',
      imagePath: 'assets/images/yoasobi.jpeg',
      price: 34.99,
    ),
    BundleItem(
      name: 'Pesta Pora',
      location: 'Bandung',
      date: '12/23/2007',
      description: 'Dont Forget to watch the concert!',
      imagePath: 'assets/images/pestapora.jpg',
      price: 39.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 30;

    return MainLayout(
      title: 'MusicTix',
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      'assets/images/concert.jpg',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  const Positioned(
                    left: 10,
                    top: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'GAIA FEST',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            letterSpacing: -1,
                          ),
                        ),
                        Text(
                          'Music For Life~',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'ALL TICKET',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1.2,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.1,
                ),
                itemCount: bundles.length,
                itemBuilder: (context, index) {
                  final item = bundles[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListPage(bundle: item),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.asset(
                            item.imagePath,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 200,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
