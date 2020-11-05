import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DropExample extends StatefulWidget {
  @override
  _DropExampleState createState() => _DropExampleState();
}

class _DropExampleState extends State<DropExample> {
  String _value = 'RO';

  List<Map<String, dynamic>> estados = [
    {'sigla': '', 'id': 0}
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_value.toString()),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: FutureBuilder(
            future: http.get(
                'https://servicodados.ibge.gov.br/api/v1/localidades/estados'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List response = jsonDecode(snapshot.data.body);

                return DropdownButton(
                  value: _value,
                  items: response
                      .map((e) => DropdownMenuItem(
                            child: Text(e['nome']),
                            value: e['sigla'],
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                );
              }

              return Container();
            }),
      ),
    );
  }

  // outra forma de fazer
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
}
