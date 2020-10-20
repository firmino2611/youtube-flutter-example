import 'package:awsome_video_player/awsome_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube/ui/awsome_video.dart';

class CardVideoImage extends StatefulWidget {
  final Map<String, dynamic> media;

  const CardVideoImage({
    Key key,
    this.media,
  }) : super(key: key);

  @override
  _CardVideoImageState createState() => _CardVideoImageState();
}

class _CardVideoImageState extends State<CardVideoImage> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network(widget.media['link'])
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 50),
      elevation: 10,
      child: Container(
        height: widget.media['type'] == 'video' ? 400 : null ,
        child: Column(
          children: [
            widget.media['type'] == 'video'
                ? AwsomeVideoPlayer(widget.media['link'])
                : Image.network(
                    widget.media['link'],
                    height: 300,
                  ),
            Text(
              widget.media['title'],
              style: TextStyle(fontSize: 17),
            ),
            Text(widget.media['description']),
          ],
        ),
      ),
    );
  }
}
