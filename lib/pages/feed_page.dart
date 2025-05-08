import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            Text("Feed Activity", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            FeedCard(user: "Kevin Cahill", content: "Created new collection: Data Visualization"),
            FeedCard(user: "Elke Vogelsang", content: "Posted a new article"),
          ],
        ),
      ),
    );
  }
}

class FeedCard extends StatelessWidget {
  final String user;
  final String content;

  const FeedCard({super.key, required this.user, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.person)),
        title: Text(user),
        subtitle: Text(content),
      ),
    );
  }
}
