import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube/ui/card_playlist.dart';

import 'package:http/http.dart' as http;
import 'package:youtube/ui/list_card_ui.dart';
import 'package:youtube/ui/video_play.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List playlists = [];
  List playlists2 = [];

  @override
  void initState() {
    super.initState();

    http.get('http://192.168.0.45:8000/api/videos?category=2').then((value) {
      List<dynamic> response = jsonDecode(value.body);

      setState(() {
        // atualiza a variael que está linkada na interface
        playlists = response;
      });
    }).catchError((err) {
      print(err);
    });

    http.get('http://192.168.0.45:8000/api/videos?category=1').then((value) {
      List<dynamic> response = jsonDecode(value.body);

      setState(() {
        // atualiza a variael que está linkada na interface
        playlists2 = response;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListCardUi(
              items: playlists,
            ),
            ListCardUi(
              items: playlists2,
            ),
            ListCardUi(
              items: playlists2,
            ),
            ListCardUi(
              items: playlists2,
            ),
            ListCardUi(
              items: playlists2,
            ),
          ],
        ),
      ),
    );
  }
}
