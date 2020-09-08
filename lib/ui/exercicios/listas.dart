import 'package:flutter/material.dart';

class Lista extends StatefulWidget {
  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  List<String> lista = ["Lucas", "Jonas", "Pryscilla"];

  List<Map<String, dynamic>> listaMap = [
    {
      "nome": "Lucas",
      "endereco": {"rua": "Rua josé"},
    }, // 0
    {
      "nome": "Jonas",
      "endereco": {"rua": "Rua josé"},
    }, // 1
    {
      "nome": "Pryscilla",
      "endereco": {"rua": "Rua josé"},
    }, // 2
  ];

  List<Pessoa> listaPessoas = [
    Pessoa('Lucas'),
    Pessoa('Jonas'),
    Pessoa('Pryscilla')
  ];

  // lista[0], lista[1]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercicio Lista'),
      ),
      body: ListView.builder(
        itemCount: listaMap.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listaMap[index]['nome']),
            subtitle: Text(listaMap[index]['endereco']['rua']),
          );
        },
      ),
    );
  }
}

class Pessoa {
  String nome;

  Pessoa(nome) {
    this.nome = nome;
  }
}
