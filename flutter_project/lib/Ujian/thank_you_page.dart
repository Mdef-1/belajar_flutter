import 'package:flutter/material.dart';
import 'package:flutter_project/Ujian/bundle_item.dart';

class ThankYouPage extends StatelessWidget {
  final String name;
  final List<MapEntry<BundleItem, int>> items;
  final double total;
  final String paymentMethod;

  const ThankYouPage({
    required this.name,
    required this.items,
    required this.total,
    required this.paymentMethod,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Thank You!',
          style: TextStyle(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Terima kasih, $name!',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('Detail Transaksi:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: items.map((entry) {
                  return ListTile(
                    title: Text(entry.key.name),
                    subtitle: Text('Jumlah: ${entry.value}'),
                    trailing: Text(
                        '\$${(entry.key.price * entry.value).toStringAsFixed(2)}'),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 10),
            Text('Total: \$${total.toStringAsFixed(2)}',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Payment succeed!! 😊',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
