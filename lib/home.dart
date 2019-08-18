import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var artista = new TextEditingController();
  var nome = new TextEditingController();

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
            Icon(
              Icons.library_music,
              size: 200,
              color: Colors.yellowAccent,
            ),
            Padding(padding: EdgeInsets.only(bottom: 30)),
            TextField(
              controller: artista,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Nome do artista/banda',
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            TextField(
              controller: nome,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Nome da música',
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 60,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                     MaterialPageRoute(
                          builder: (context) =>
                             Lyrics(nome: nome.text, artista: artista.text,),
                      ));
                    },
                    child: Text(
                      'Ver Letra',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    color: Colors.pink[900],
                    splashColor: Colors.blueAccent,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}


//SEGUNDA TELA
class Lyrics extends StatefulWidget {

  Future<String> getData() async {

  var request = "https://api.lyrics.ovh/v1/$artista/$nome";
 
  var resposta = await http.get(request);

  print(resposta.body);

  return json.decode(resposta.body);

}

  final String nome;
  final String artista;

  Lyrics({Key key, @required this.nome, @required this.artista}) : super (key: key);

  @override
  _LyricsState createState() => _LyricsState();
}

class _LyricsState extends State<Lyrics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
        body:  build(

            ),
        );
  }
}

