import 'package:flutter/material.dart';
import 'package:flutter_project/Ujian/bundle_item.dart';
import 'thank_you_page.dart';

class PaymentPage extends StatefulWidget {
  final Map<BundleItem, int> selectedItems;

  const PaymentPage(this.selectedItems, {super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _paymentController = TextEditingController();

  double getTotal() {
    return widget.selectedItems.entries
        .fold(0, (sum, entry) => sum + (entry.key.price * entry.value));
  }

  @override
  Widget build(BuildContext context) {
    final total = getTotal();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Form Payment',
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
          children: [
            const Text('Detail payment:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: [
                  ...widget.selectedItems.entries.map((entry) {
                    final item = entry.key;
                    final quantity = entry.value;

                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text('Jumlah: $quantity'),
                      trailing: Text(
                        '\$${(item.price * quantity).toStringAsFixed(2)}',
                      ),
                    );
                  }).toList(),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration:
                              const InputDecoration(labelText: 'Nama Lengkap'),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Wajib diisi'
                              : null,
                        ),
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) =>
                              value == null || !value.contains('@')
                                  ? 'Email tidak valid'
                                  : null,
                        ),
                        TextFormField(
                          controller: _phoneController,
                          decoration:
                              const InputDecoration(labelText: 'Nomor HP'),
                          keyboardType: TextInputType.phone,
                          validator: (value) =>
                              value == null || value.length < 10
                                  ? 'Nomor tidak valid'
                                  : null,
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _paymentController,
                          decoration: const InputDecoration(
                              labelText: 'Jumlah yang Dibayar'),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan jumlah pembayaran';
                            }
                            final paid = double.tryParse(value);
                            if (paid == null) {
                              return 'Format angka tidak valid';
                            }
                            if (paid < total) {
                              return 'Pembayaran kurang dari total (\$${total.toStringAsFixed(2)})';
                            }
                            if (paid > total) {
                              return 'Pembayaran melebihi total (\$${total.toStringAsFixed(2)})';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text('Total: \$${total.toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThankYouPage(
                        name: _nameController.text,
                        items: widget.selectedItems.entries.toList(),
                        total: total,
                        paymentMethod:
                            'Manual Input \$${_paymentController.text}',
                      ),
                    ),
                  );
                }
              },
              child: const Text('Process'),
            ),
          ],
        ),
      ),
    );
  }
}
