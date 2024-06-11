import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'VideoDetailScreen.dart';

class EdukasiScreen extends StatefulWidget {
  @override
  _EdukasiScreenState createState() => _EdukasiScreenState();
}

class _EdukasiScreenState extends State<EdukasiScreen> {
  final List<Map<String, String>> videos = [
    {'videoId': 'eA1tV5CSq-U', 'description': 'Ternak Kambing'},
    {'videoId': 'OyIRNjqhEpo', 'description': 'Cara Ternak Ayam'},
    {'videoId': 'yidbHYrDjJM', 'description': 'Tips Berternak Sapi'},
    {'videoId': 'tKVEenURymU', 'description': 'Agro Wisata Edukasi Peternakan'},  // Video baru
    // Tambahkan lebih banyak video sesuai kebutuhan
  ];

  Future<Map<String, String>> _getVideoDetails(String videoId) async {
    final apiKey = 'AIzaSyD9G3zy3W1qZ8vPV46Ew549id4lbvGvxTw'; // Replace with your actual API key
    final url = 'https://www.googleapis.com/youtube/v3/videos?part=snippet&id=$videoId&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      if (decodedResponse['items'].isNotEmpty) {
        final snippet = decodedResponse['items'][0]['snippet'];
        final title = snippet['title'];
        final thumbnailUrl = snippet['thumbnails']['high']['url'];
        return {'title': title, 'thumbnailUrl': thumbnailUrl};
      } else {
        throw Exception('Video details not found');
      }
    } else {
      throw Exception('Failed to fetch video details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edukasi Peternakan'),
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          final videoId = video['videoId'] ?? '';
          final description = video['description'] ?? 'No description available';

          return FutureBuilder<Map<String, String>>(
            future: _getVideoDetails(videoId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error fetching video details: ${snapshot.error}'));
              } else if (!snapshot.hasData) {
                return Center(child: Text('No data found'));
              } else {
                final videoDetails = snapshot.data!;
                final title = videoDetails['title']!;
                final thumbnailUrl = videoDetails['thumbnailUrl']!;

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoDetailScreen(
                          videoId: videoId,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(6.0),
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image: NetworkImage(thumbnailUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(description),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: EdukasiScreen(),
  ));
}
