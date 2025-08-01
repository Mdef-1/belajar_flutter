import 'package:flutter/material.dart';
import 'package:flutter_project/main_layout.dart';
import 'package:flutter_project/catalog_product/catalog_list.dart';


class Catalog extends StatelessWidget {
  const Catalog({super.key});

  final List<Map<String, dynamic>> bestProduct = const [
    {
      'name': 'Vintage Jacket',
      'image': 'https://picsum.photos/id/1011/150/100',
      'harga': 750000,
      'detail_product': [
        {'description': 'Stylish and warm, perfect for autumn fashion.'},
      ]
    },
    {
      'name': 'Classic Bag',
      'image': 'https://picsum.photos/id/1012/150/100',
      'harga': 1000000,
      'detail_product': [
        {'description': 'Premium leather with elegant craftsmanship.'},
      ]
    },
    {
      'name': 'Urban Shoes',
      'image': 'https://picsum.photos/id/1013/150/100',
      'harga': 950000,
      'detail_product': [
        {'description': 'Comfortable footwear for all-day city walks.'},
      ]
    },
    {
      'name': 'Denim Shirt',
      'image': 'https://picsum.photos/id/1015/150/100',
      'harga': 480000,
      'detail_product': [
        {'description': 'Casual denim look for everyday style.'},
      ]
    },
  ];

  final List<Map<String, dynamic>> allProduct = const [
    {
      'name': 'Leather Wallet',
      'image': 'https://picsum.photos/id/1001/150/100',
      'harga': 300000,
      'detail_product': [
        {'description': 'Compact design with high durability.'}
      ]
    },
    {
      'name': 'Canvas Hat',
      'image': 'https://picsum.photos/id/1002/150/100',
      'harga': 150000,
      'detail_product': [
        {'description': 'Lightweight hat for outdoor activities.'}
      ]
    },
    {
      'name': 'Silk Scarf',
      'image': 'https://picsum.photos/id/1003/150/100',
      'harga': 220000,
      'detail_product': [
        {'description': 'Soft silk with minimalist patterns.'}
      ]
    },
    {
      'name': 'Sneakers',
      'image': 'https://picsum.photos/id/1004/150/100',
      'harga': 850000,
      'detail_product': [
        {'description': 'Trendy sneakers with great cushioning.'}
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'FLEUR',
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Stack(
                children: [
                  Image.network(
                    'https://picsum.photos/800/200',
                    
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.black.withOpacity(0.3),
                  ),
                  const Positioned(
                    left: 10,
                    top: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'New Arrival',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Fashion Item',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: const Text(
                'OUR BEST PRODUCT',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1.2,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: SizedBox(
                width: 350,
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bestProduct.length,
                  itemBuilder: (context, index) {
                    final product = bestProduct[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CatalogList(
                              productList: bestProduct,
                              title: 'Best Product',
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            product['image'],
                            fit: BoxFit.cover,
                            width: 150,
                            height: 100,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Center(
              child: Text(
                'ALL PRODUCT',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 350,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: allProduct.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 3 / 2,
                  ),
                  itemBuilder: (context, index) {
                    final product = allProduct[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CatalogList(
                              productList: allProduct,
                              title: 'All Product',
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          product['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  } 
}
