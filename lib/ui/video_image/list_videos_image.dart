import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:youtube/ui/video_image/card_video_image.dart';

class ListVideoImage extends StatefulWidget {
  @override
  _ListVideoImageState createState() => _ListVideoImageState();
}

class _ListVideoImageState extends State<ListVideoImage> {
  // declaração
  List<dynamic> listaApi = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercicio pegando da API com FutureBuilder'),
      ),
      body: FutureBuilder(
        // FutureBuilder é componente que renderiza de acordo com a resposta da requisição
        future: http.get(
            'http://192.168.0.143:8000/api/videos'), // A chamada para api (ou qualquer chamada assincrona)
        // initialData: http.Response,
        builder: (context, snapshot) {
          // Verifica se foi retornadoa alguma informação da requisição, pois mesmo sem ter terminado a requisição o builder é chamado.
          if (snapshot.hasData) {
            // Convertendo os dados da resposta para mapa
            listaApi = jsonDecode(snapshot.data.body);

            return ListView.builder(
              itemCount: listaApi.length,
              itemBuilder: (context, index) {
                return CardVideoImage(
                      media: listaApi[index],
                    );
              },
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
