import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';

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
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFEEEEEE),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
              future: _getLista(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Center(
                      child: Container(
                        width: 200,
                        height: 200,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black),
                          strokeWidth: 5,
                        ),
                      ),
                    );
                  default:
                    if (snapshot.hasError)
                      return Container(
                        child: Text(
                          "Erro ao acessar a internet",
                          style: TextStyle(color: Colors.amber[900]),
                        ),
                      );
                    else
                      return criarListagem(context, snapshot);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget criarListagem(BuildContext context, AsyncSnapshot snapshot) {
    return ListView.builder(
        padding: EdgeInsets.all(4),
        scrollDirection: Axis.vertical,
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: <Widget>[
                    FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: snapshot.data[index]["Emi_Logo"]
                          .toString()
                          .replaceAll(
                              "~/", "http://controle.mdvsistemas.com.br/"),
                      height: 75,
                      width: 75,
                      fit: BoxFit.cover,
                    ),
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            snapshot.data[index]["Emi_Nome"].toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    )
                  ],
                ),
              ),
            ),
            onTap: () {},
          );
        });
  }
}
