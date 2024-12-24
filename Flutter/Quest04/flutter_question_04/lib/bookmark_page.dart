import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Latest Bookmarks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.bookmark),
                  title: Text('Insurtech startup PasarPolis gets 54 million'),
                  subtitle: Text('TECHNOLOGY'),
                  trailing: Icon(Icons.close),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
