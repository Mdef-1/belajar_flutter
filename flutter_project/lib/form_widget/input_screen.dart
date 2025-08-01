import 'package:flutter/material.dart';
import 'package:flutter_project/form_widget/output_screen.dart';
import 'package:intl/intl.dart';
import 'package:flutter_project/main_layout.dart';

class InputFormScreen extends StatefulWidget {
  const InputFormScreen({super.key});

  @override
  State<InputFormScreen> createState() => _InputFormScreenState();
}

class _InputFormScreenState extends State<InputFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController namaController = TextEditingController();
  final TextEditingController tglLahirController = TextEditingController();

  String? jenisKelamin;
  String? agama;

  final List<String> agamaList = [
    "Islam",
    "Kristen",
    "Hindu",
    "Budha",
    "Katolik"
  ];

  @override
  void dispose() {
    namaController.dispose();
    tglLahirController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2005),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      final String formattedDate = DateFormat('dd/MM/yyyy').format(picked);
      tglLahirController.text = formattedDate;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (jenisKelamin == null || jenisKelamin!.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Pilih Jenis Kelamin")),
        );
        return;
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OutputFormScreen(
            nama: namaController.text,
            jk: jenisKelamin!,
            tglLahir: tglLahirController.text,
            agama: agama!,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Input Form",
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const Text(
                  "Formulir Biodata",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: namaController,
                  decoration: const InputDecoration(
                    labelText: "Nama Lengkap",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      (value == null || value.isEmpty) ? "Input Nama" : null,
                ),
                const SizedBox(height: 16),
                const Text(
                  "Jenis Kelamin",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: "Laki-laki",
                      groupValue: jenisKelamin,
                      onChanged: (value) =>
                          setState(() => jenisKelamin = value),
                    ),
                    const Text("Laki-laki"),
                    Radio<String>(
                      value: "Perempuan",
                      groupValue: jenisKelamin,
                      onChanged: (value) =>
                          setState(() => jenisKelamin = value),
                    ),
                    const Text("Perempuan"),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: tglLahirController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: "Tanggal Lahir",
                    border: OutlineInputBorder(),
                  ),
                  onTap: _pickDate,
                  validator: (value) => (value == null || value.isEmpty)
                      ? "Input Tanggal Lahir"
                      : null,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: "Agama",
                    border: OutlineInputBorder(),
                  ),
                  value: agama,
                  items: agamaList
                      .map(
                        (item) =>
                            DropdownMenuItem(value: item, child: Text(item)),
                      )
                      .toList(),
                  onChanged: (value) => setState(() => agama = value),
                  validator: (value) =>
                      (value == null || value.isEmpty) ? "Pilih Agama" : null,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(color: Colors.black),
                      ),
                    ),
                    child: const Text(
                      "Simpan",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
