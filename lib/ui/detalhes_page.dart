import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:transparent_image/transparent_image.dart';

class DetalhesPage extends StatefulWidget {
  final Map dadosEmissora;

  DetalhesPage(this.dadosEmissora);

  @override
  _DetalhesPageState createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.dadosEmissora['Emi_Nome'].toString(),
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFEEEEEE),
      body: Padding(
        padding: EdgeInsets.all(44),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: widget.dadosEmissora['Emi_Logo']
                  .toString()
                  .replaceAll("~/", 'http://controle.mdvsistemas.com.br/'),
              fit: BoxFit.cover,
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    widget.dadosEmissora['Emi_Nome'].toString(),
                    style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
                  ),
                  Text(
                    "Código: " + widget.dadosEmissora['Emi_Codigo'].toString(),
                    style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
