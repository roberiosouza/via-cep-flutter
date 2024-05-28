import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _cepController = TextEditingController();
  String _logradouro = "";
  String _bairro = "";
  String _uf = "";

  _recuperarCep() async {
    var url =
        Uri.parse("https://viacep.com.br/ws/${_cepController.text}/json/");
    http.Response respose;
    respose = await http.get(url);
    Map<String, dynamic> dados = json.decode(respose.body);

    setState(() {
      _logradouro = dados["logradouro"];
      _bairro = dados["bairro"];
      _uf = dados["uf"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo API viaCEP"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(50, 80, 50, 0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Digite aqui um CEP"),
              controller: _cepController,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: ElevatedButton(
                onPressed: _recuperarCep, child: Text("Clique Aqui")),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Text("Logradouro: ${_logradouro}"),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Text("Bairro: ${_bairro}"),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Text("UF: ${_uf}"),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
