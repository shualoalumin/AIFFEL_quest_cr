import 'package:flutter/material.dart';

class MediaCollectionPage extends StatelessWidget {
  const MediaCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Media Collection'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '13 Videos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.video_collection),
                  title: Text('The IPO parade continues as Wish files'),
                  subtitle: Text('9:24'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
