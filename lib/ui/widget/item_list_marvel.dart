import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:marvelapp/models/character_response.dart';
import 'package:marvelapp/ui/screens/marvel_detail.dart';

class ItemListMarvel extends StatelessWidget {
  final Character character;

  ItemListMarvel({this.character});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MarvelDetail(character))),
                //callback(character.id),
                child: Card(
                  child: Container(
                    height: (MediaQuery.of(context).size.height) - 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: character.thumbnail != null
                            ? NetworkImage(character.thumbnail.path +
                                "." +
                                character.thumbnail.extension)
                            : NetworkImage(
                                "https://abrakadabra.vteximg.com.br/arquivos/ids/235915/banner_640x500_hotsite_marvel.jpg?v=637302469381230000"),
                      ),
                    ),
                  ),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Tooltip(
                message: character.name,
                child: Text(
                  character.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.none),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
