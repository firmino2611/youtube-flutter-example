import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube/ui/video_play.dart';

class ListCardUi extends StatefulWidget {
  final List items;
  final Axis direction;

  const ListCardUi(
      {Key key, @required this.items, this.direction = Axis.horizontal})
      : super(key: key);

  @override
  _ListCardUiState createState() => _ListCardUiState();
}

class _ListCardUiState extends State<ListCardUi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView.builder(
        scrollDirection: widget.direction,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => VideoPlay(
                      link: widget.items[index]['link'],
                    ),
                  ),
                );
              },
              child: Column(
                children: [
                  // imagem
                  CachedNetworkImage(
                    imageUrl: widget.items[index]['image'],
                    width: 200,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  // titulo
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.items[index]['title'],
                      style: TextStyle(fontSize: 17),
                    ),
                  )
                ],
              ),
            ),
          );

          // return ListTile(
          //   title: Text(
          //     playlists[index]['title'],
          //   ),

          //   // evento de clique
          //   onTap: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (BuildContext context) => VideoPlay(
          //           link: playlists[index]['link'],
          //         ),
          //       ),
          //     );
          //   },
          // );
        },
      ),
    );
  }
}
