import 'package:flutter/material.dart';
import 'package:flutter_project/Ujian/bundle_item.dart';
import 'payment_page.dart';

class ListPage extends StatefulWidget {
  final BundleItem bundle;

  const ListPage({super.key, required this.bundle});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final Map<BundleItem, int> selectedQuantities = {};

  List<BundleItem> getAllBundles() => const [
        BundleItem(
          name: 'Ciggarettes After Sex Ticket',
          location: 'Chicago',
          date: '12/23/2007',
          description: 'Kumpulan komponen UI untuk aplikasi mobile.',
          imagePath: 'assets/images/cas.jpeg',
          price: 19.99,
        ),
        BundleItem(
          name: 'Maroon 5',
          location: 'New York Ticket',
          date: '12/23/2007',
          description: 'Widget dan layout dasar untuk Flutter.',
          imagePath: 'assets/images/maroon-5.jpeg',
          price: 29.99,
        ),
        BundleItem(
          name: 'Coltrave Ticket',
          location: 'Tokyo',
          date: '12/23/2007',
          description: 'Bundle animasi untuk interaksi yang lebih hidup.',
          imagePath: 'assets/images/japan.jpg',
          price: 24.99,
        ),
        BundleItem(
          name: 'Yoasobi Ticket',
          location: 'Jakarta',
          date: '12/23/2007',
          description: 'Template API untuk integrasi backend.',
          imagePath: 'assets/images/yoasobi.jpeg',
          price: 34.99,
        ),
        BundleItem(
          name: 'Pesta Pora Ticket',
          location: 'Bandung',
          date: '12/23/2007',
          description: 'Desain halaman toko online siap pakai.',
          imagePath: 'assets/images/pestapora.jpg',
          price: 39.99,
        ),
      ];

  @override
  void initState() {
    super.initState();
    selectedQuantities[widget.bundle] = 1;
  }

  @override
  Widget build(BuildContext context) {
    final selectedBundles = selectedQuantities.entries
        .where((entry) => entry.value > 0)
        .map((entry) => entry.key)
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.bundle.name,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            letterSpacing: 1,
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: selectedBundles.isEmpty
                  ? const Center(child: Text('No ticket choosed.'))
                  : ListView.builder(
                      itemCount: selectedBundles.length,
                      itemBuilder: (context, index) {
                        final item = selectedBundles[index];
                        final quantity = selectedQuantities[item] ?? 0;

                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side:
                                BorderSide(color: Colors.grey.withOpacity(0.4)),
                          ),
                          elevation: 0,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        item.imagePath,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(item.name,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text(item.description),
                                          Text(
                                              '\$${item.price.toStringAsFixed(2)}',
                                              style: const TextStyle(
                                                  color: Colors.green)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('amount:'),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.remove),
                                          onPressed: quantity > 1
                                              ? () {
                                                  setState(() {
                                                    selectedQuantities[item] =
                                                        quantity - 1;
                                                  });
                                                }
                                              : null,
                                        ),
                                        Text(quantity.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        IconButton(
                                          icon: const Icon(Icons.add),
                                          onPressed: () {
                                            setState(() {
                                              selectedQuantities[item] =
                                                  quantity + 1;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            ElevatedButton(
              onPressed: selectedBundles.isEmpty
                  ? null
                  : () {
                      final selectedItems = Map.fromEntries(
                        selectedQuantities.entries
                            .where((entry) => entry.value > 0),
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentPage(selectedItems),
                        ),
                      );
                    },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
