import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  final String title;
  final String content;

  const ArticlePage({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(content),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.blue,
      unselectedItemColor: const Color.fromARGB(255, 175, 167, 167),
      currentIndex: 0, // Adjust this index based on the current page
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/home');
            break;
          case 1:
            Navigator.pushNamed(context, '/bookmarks');
            break;
          case 2:
            Navigator.pushNamed(context, '/media');
            break;
          case 3:
            Navigator.pushNamed(context, '/search');
            break;
          case 4:
            Navigator.pushNamed(context, '/settings');
            break;
        }
      },
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.video_collection),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "",
        ),
      ],
    );
  }
}
