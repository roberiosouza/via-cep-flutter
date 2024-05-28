import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _recuperarCep() async {
    var url = Uri.parse("https://viacep.com.br/ws/24210410/json/");
    http.Response respose;
    respose = await http.get(url);
    Map<String, dynamic> dados = json.decode(respose.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo API viaCEP"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: _recuperarCep, child: Text("Clique Aqui"))
        ],
      ),
    );
  }
}
