import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FutureExample extends StatefulWidget {
  @override
  _FutureExampleState createState() => _FutureExampleState();
}

class _FutureExampleState extends State<FutureExample> {
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
        future: http.get('http://172.17.0.1:8000/api/videos?category=2'), // A chamada para api (ou qualquer chamada assincrona)
        // initialData: http.Response,
        builder: (context, snapshot) {
          // Verifica se foi retornadoa alguma informação da requisição, pois mesmo sem ter terminado a requisição o builder é chamado.
          if (snapshot.hasData) {
            // Convertendo os dados da resposta para mapa
            listaApi = jsonDecode(snapshot.data.body);

            return ListView.builder(
              itemCount: listaApi.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.access_alarm),
                  trailing: Icon(Icons.g_translate),
                  title: Text(listaApi[index]['title']),
                  subtitle: Text(listaApi[index]['link']),
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
