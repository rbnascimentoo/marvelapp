import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvelapp/bloc/comics_bloc.dart';
import 'package:marvelapp/models/character_response.dart';
import 'package:marvelapp/models/comic_response.dart';
import 'package:marvelapp/ui/widget/carousel_marvel.dart';

class MarvelDetail extends StatefulWidget {
  Character character;

  MarvelDetail(this.character);

  @override
  _MarvelDetailState createState() => _MarvelDetailState();
}

class _MarvelDetailState extends State<MarvelDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.character.name),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: (MediaQuery.of(context).size.height),
        child: ListView(
          children: [
            Text(
              widget.character.description,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 20,
                fontWeight: FontWeight.w300
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Comics",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            CarouselMarvel<Comics>(idCharacter: widget.character.id.toString(),
                bloc: ComicsBloc()),
            SizedBox(
              height: 1,
            ),
            Text(
              "Series",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            CarouselMarvel<Comics>(idCharacter: widget.character.id.toString(),
                bloc: ComicsBloc()),
            SizedBox(
              height: 1,
            ),
            Text(
              "Stories",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            CarouselMarvel<Comics>(idCharacter: widget.character.id.toString(),
                bloc: ComicsBloc()),
          ],
        ),
      ),
    );
  }
}
