import 'package:flutter/material.dart';

class LetraMusic extends StatefulWidget {
  final String nome;

  LetraMusic({Key key, this.nome}) : super (key: key);

  @override
  _LetraMusicState createState() => _LetraMusicState();
}

class _LetraMusicState extends State<LetraMusic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: SingleChildScrollView(

        padding: EdgeInsets.only(
          top: 120,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(bottom: 30)),
            new Text("${widget.nome}"),
          ],
        ),
      ),
    );
  }
}

