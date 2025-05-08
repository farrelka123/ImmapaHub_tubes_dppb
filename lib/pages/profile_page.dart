import 'package:flutter/material.dart';
import '../login_page.dart'; // Untuk logout kembali ke login

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.notifications_none, color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=5'),
          ),
          const SizedBox(height: 12),
          const Text("Friedrich Beren", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const Text("@friedrich_beren", style: TextStyle(color: Colors.grey)),

          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _Stat(title: 'Followers', value: '28k'),
              _Stat(title: 'Posts', value: '13'),
              _Stat(title: 'Likes', value: '734k'),
              _Stat(title: 'Views', value: '1.2M'),
            ],
          ),

          const SizedBox(height: 20),
          // Tab Bar
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.blue,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: 'Updates'),
              Tab(text: 'Collections'),
              Tab(text: 'About'),
            ],
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildUpdates(),
                _buildCollections(),
                _buildAbout(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpdates() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _PostCard(title: "New Post: UX Design", color: Colors.lightGreenAccent),
        _PostCard(title: "Shared: Motion UI Tips", color: Colors.lightBlueAccent),
      ],
    );
  }

  Widget _buildCollections() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _PostCard(title: "My UI Kit", color: Colors.amberAccent),
        _PostCard(title: "Flutter Samples", color: Colors.purpleAccent),
      ],
    );
  }

  Widget _buildAbout() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        "Hi, I'm Friedrich. A passionate designer and developer who loves to build beautiful mobile apps with Flutter. Always learning and creating.",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String title;
  final String value;
  const _Stat({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class _PostCard extends StatelessWidget {
  final String title;
  final Color color;
  const _PostCard({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
