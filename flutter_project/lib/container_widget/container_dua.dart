import "package:flutter/material.dart";
import "package:flutter_project/container_widget/container_satu.dart";
import "package:flutter_project/main_layout.dart";

class ContainerDua extends StatelessWidget {
  const ContainerDua({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Container Dua",
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightBlueAccent,
              Colors.redAccent,
              Colors.pinkAccent,
              Colors.blueGrey,
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContainerSatu(),
                ),
              );
            },
            child: Text(
              'Pindah Ke Halaman',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
            ),
          ),
        ),
      ),
    );
  }
}
