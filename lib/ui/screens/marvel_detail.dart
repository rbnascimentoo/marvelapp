import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/application/config.dart';
import 'package:marvel_app/models/character.dart';

class MarvelDetail extends StatefulWidget {
  Character character;

  MarvelDetail(this.character);

  @override
  _MarvelDetailState createState() => _MarvelDetailState();
}

class _MarvelDetailState extends State<MarvelDetail> {
  @override
  Widget build(BuildContext context) {
    var config = Config();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.character.name),
      ),
      body: Container(
        child: Text(widget.character.description,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 26,
            )),
      ),
    );
  }
}
