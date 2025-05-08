import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Explore Collections", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: ListView(
                children: const [
                  ExploreCard(title: "Product Management", description: "By Eike Vogelsang"),
                  ExploreCard(title: "Cybersecurity", description: "By Lester Hertz"),
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
  final String description;

  const ExploreCard({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.folder),
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }
}
