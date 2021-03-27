import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/models/character.dart';
import 'package:marvel_app/ui/screens/marvel.dart';

class ItemListMarvel extends StatelessWidget {

  final void Function(int) callback;
  final Character character;

  ItemListMarvel({this.callback, this.character});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Container(
          height: 400,
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MarvelApp()
                    )
                ),//callback(character.id),
                child: Card(
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: character.thumbnail != null ? NetworkImage(character.thumbnail.path+"."+character.thumbnail.extension) : NetworkImage("https://abrakadabra.vteximg.com.br/arquivos/ids/235915/banner_640x500_hotsite_marvel.jpg?v=637302469381230000"),
                      ),
                    ),
                  ),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Text(
                character.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    decoration: TextDecoration.none
                ),
              ),
            ],
          ),
        )
    );
  }
}
