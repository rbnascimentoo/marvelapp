import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:marvelapp/models/character_response.dart';
import 'package:marvelapp/ui/screens/marvel_detail.dart';

//Item list character marvel
class ItemListMarvel extends StatelessWidget {
  final Character character;

  ItemListMarvel({this.character});

  @override
  Widget build(BuildContext context) {
    var heightContainerCard = (MediaQuery.of(context).size.height) - 200;

    return Expanded(
      key: Key('expandedItemLIstMarvel${character.id}'),
      flex: 3,
      child: Container(
        key: Key('containerItemListMarvel${character.id}'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              key: Key('gestureDetectorItemList${character.id}'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  //TODO utilizar route
                  builder: (context) => MarvelDetail(character),
                ),
              ),
              //callback(character.id),
              child: Card(
                key: Key('cardItemListMarvel${character.id}'),
                child: Hero(
                  key: Key('heroItemList${character.id}'),
                  tag: character.id,
                  child: Container(
                    key: Key('containerHero${character.id}'),
                    height: heightContainerCard < 0 ? 0 : heightContainerCard,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: character.thumbnail != null
                            ? NetworkImage(
                                character.thumbnail.path +
                                    "." +
                                    character.thumbnail.extension,
                              )
                            : NetworkImage(
                                "https://abrakadabra.vteximg.com.br/arquivos/ids/235915/banner_640x500_hotsite_marvel.jpg?v=637302469381230000"),
                      ),
                    ),
                  ),
                ),
                elevation: 9,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Tooltip(
              key: Key('tooltipNameItemListMarvel${character.id}'),
              message: character.name,
              child: Text(
                character.name,
                key: Key('textNameItemListMarvel${character.id}'),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
