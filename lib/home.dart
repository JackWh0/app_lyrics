import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var artista = new TextEditingController();
  var musica = new TextEditingController();

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
              controller: musica,
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
                            builder: (context) => Lyrics(
                              musica: musica.text,
                              artista: artista.text,
                            ),
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
  Future<Map> getData() async {
    var request = "https://api.lyrics.ovh/v1/$artista/$musica";

    var resposta = await http.get(request);

    print(resposta.body);

    return json.decode(resposta.body);
  }

  final String musica;
  final String artista;

  Lyrics({Key key, @required this.musica, @required this.artista})
      : super(key: key);

  @override
  _LyricsState createState() => _LyricsState();
}

class _LyricsState extends State<Lyrics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: FutureBuilder(
        future: widget.getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Center(
                child: Text(
                  "Carregando...",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                      color: Colors.amber),
                ),
              );
              break;
            default:
              if (snapshot.hasData) {
                return Scaffold(
                  backgroundColor: Colors.pink,
                  body: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      top: 70,
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "${widget.musica}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 45.0,
                              color: Colors.amber),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 30.0),
                          child: Text(
                            "${widget.artista}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28.0,
                                color: Colors.black26),
                          ),
                        ),
                        Text(
                          snapshot.data['lyrics'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.white),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 30.0),
                        ),
                      ],
                    ),
                  ),
                );
                //enviar o snapshot como parametro para inicial e fazer a busca; lá do Widget
              } else {
                return Center(
                  child: Text("Erro na conexão."),
                );
              }
          }
        },
      ),
    );
  }
}
