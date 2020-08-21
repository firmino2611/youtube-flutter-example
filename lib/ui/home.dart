import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:youtube/ui/card_playlist.dart';

import 'package:http/http.dart' as http;
import 'package:youtube/ui/video_play.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List playlists = [];

  @override
  void initState() {
    super.initState();

    http.get('http://192.168.0.45:8000/api/videos').then((value) {
      List<dynamic> response = jsonDecode(value.body);

      setState(() {
        playlists = response;
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube API'),
      ),
      body: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: playlists.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                playlists[index]['title'],
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => VideoPlay(link: playlists[index]['link'],),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
