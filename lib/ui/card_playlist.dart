import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:youtube/ui/videos.dart';

class CardPlaylist extends StatelessWidget {
  final String image;
  final String title;
  final String id;

  CardPlaylist({this.image, this.title = '', this.id});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () async {
          Navigator.of(context)
            .push( MaterialPageRoute(builder: (BuildContext context) => Video(id: this.id, playlistName: this.title,) ));
        },
        child: Container(
          height: 200,
          width: 200,
          child: Column(
            children: [
              Image.network(this.image),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(this.title),
              )
            ],
          ),
        ),
      ),
    );
  }
}
