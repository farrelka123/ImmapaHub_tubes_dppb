import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("Explore Collections", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  ExploreCard(title: "Product Management", author: "Eike Vogelsang"),
                  ExploreCard(title: "Cybersecurity Essentials", author: "Lester Hertz"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ExploreCard extends StatelessWidget {
  final String title;
  final String author;

  const ExploreCard({super.key, required this.title, required this.author});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: const Icon(Icons.folder_open_rounded, size: 40, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(author),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
