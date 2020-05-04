import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<dynamic>> _getLista() async {
    String link =
        "http://controle.mdvsistemas.com.br/novelas/emissoras/getemissora";
    http.Response response;
    response = await http.get(link);

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Emissoras",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      backgroundColor: Color(0xFFEEEEEE),
      body: Column(),
    );
  }
}
