import 'package:flutter/material.dart';
import 'home.dart';

class LetraMusic extends StatefulWidget {
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

          ],
        ),
      ),
    );
  }
}

