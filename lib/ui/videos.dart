import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Video extends StatefulWidget {
  final String id;
  final String playlistName;

  const Video({Key key, this.id, this.playlistName}) : super(key: key);

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  List videos = [];

  @override
  void initState() {
    super.initState();

    http.get('https://www.googleapis.com/youtube/v3/playlistItems?' +
            'part=snippet' +
            '&key=AIzaSyCUjqp2xib8ZMQqWJDISAx5jfwX2LKzgro' +
            '&channelId=UCOBIOdl2QBI6EEOLdndpj9Q' +
            '&playlistId=' +
            widget.id +
            '&maxResults=50')
        .then((response) {
      Map<String, dynamic> resp = jsonDecode(response.body);

      setState(() {
        videos = resp['items'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Videos da Playlist'),
      ),
      body: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: videos.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: InkWell(
                onTap: () async {},
                child: Container(
                  child: Column(
                    children: [
                      Image.network(videos[index]['snippet']['thumbnails']
                          ['high']['url']),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          videos[index]['snippet']['channelTitle'],
                          style: TextStyle(fontSize: 50),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.playlistName,
                          style: TextStyle(fontSize: 50),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          videos[index]['snippet']['title'],
                          style: TextStyle(fontSize: 50),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
