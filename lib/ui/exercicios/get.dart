import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Get extends StatefulWidget {
  @override
  _GetState createState() => _GetState();
}

class _GetState extends State<Get> {
  // declaração
  List<dynamic> listaApi = [];

  @override
  void initState() {
    super.initState();

    http.get('http://172.17.0.1:8000/api/videos?category=2').then((response) {
      // converte a resposta para maps ou listas
      setState(() {
        listaApi = jsonDecode(response.body);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercicio Lista pegando da API'),
      ),
      body: ListView.builder(
        itemCount: listaApi.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.access_alarm),
            trailing: Icon(Icons.g_translate),
            title: Text(listaApi[index]['title']),
            subtitle: Text(listaApi[index]['link']),
          );
        },
      ),
    );
  }
}
