import 'package:flutter/material.dart';
import 'package:youtube/ui/video_image/list_videos_image.dart';

import 'ui/video_image/list_videos_image.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ListVideoImage(),
    ),
  );
}
