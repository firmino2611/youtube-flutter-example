import 'package:flutter/material.dart';

class CardPlaylist extends StatelessWidget {
  final String image;
  final String title;

  CardPlaylist({
    this.image,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
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
    );
  }
}
