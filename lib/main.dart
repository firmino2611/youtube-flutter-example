import 'package:flutter/material.dart';
import 'package:youtube/ui/video_image/list_videos_image.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: InkWell(
          child: Image.network(
              'https://s2.glbimg.com/nksCDlmBan7iiSCgJqZdN7A5ekc=/e.glbimg.com/og/ed/f/original/2019/10/22/6th-place_small-white-hair-spider_javier-ruperez_nikon-small-world.jpg',
              fit: BoxFit.fitHeight,),
        ),
      ),
    ),
  );
}
