import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:youtube/ui/card_playlist.dart';

import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List playlists = [];

  @override
  void initState() {
    super.initState();

    http.get('https://www.googleapis.com/youtube/v3/playlists?' +
            'part=snippet' +
            '&key=AIzaSyCUjqp2xib8ZMQqWJDISAx5jfwX2LKzgro' +
            '&channelId=UCOBIOdl2QBI6EEOLdndpj9Q'
                '&maxResults=50')
        .then((value) {
          Map<String, dynamic> response = jsonDecode(value.body);
          setState(() {
            playlists = response['items'];
          });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube API'),
      ),
      body: Container(
        height: 250,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: playlists.length,
          itemBuilder: (context, index) {
            return CardPlaylist(
              image: playlists[index]['snippet']['thumbnails']['medium']['url'],
              title: playlists[index]['snippet']['title'],
            );
          },
        ),
      ),
    );
  }
}
