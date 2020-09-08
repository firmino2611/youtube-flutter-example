import 'package:flutter/material.dart';
import 'package:youtube/ui/exercicios/listas.dart';


void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Lista(),
    ),
  );
}
