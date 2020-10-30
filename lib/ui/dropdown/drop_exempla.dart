import 'package:flutter/material.dart';

class DropExample extends StatefulWidget {
  @override
  _DropExampleState createState() => _DropExampleState();
}

class _DropExampleState extends State<DropExample> {
  int _value = 1;

  List<Map<String, dynamic>> estados = [
    {'nome': 'SP', 'id': 1},
    {'nome': 'RJ', 'id': 2},
    {'nome': 'MG', 'id': 3},
    {'nome': 'ES', 'id': 4}
  ];

  gerarListaEstados() {
    List<DropdownMenuItem<int>> auxiliar = [];

    estados.forEach((estado) {
      auxiliar.add(DropdownMenuItem(
        child: Text(estado['nome']),
        value: estado['id'],
      ));
    });

    return auxiliar;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_value.toString()),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: DropdownButton(
          value: _value,
          // items: gerarListaEstados(),
          items: estados
              .map(
                (estado) => DropdownMenuItem(
                  child: Text(estado['nome']),
                  value: estado['id'],
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
        ),
      ),
    );
  }
}
