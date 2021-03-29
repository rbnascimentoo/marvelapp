import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvelapp/models/character_response.dart';

class ItemCarouselMarvel<T> extends StatelessWidget {

  final T model;

  ItemCarouselMarvel({this.model});

  @override
  Widget build(BuildContext context) {
    Character character;

    if (model is Character) {
      character = model as Character;
    }

    return Expanded(
        flex: 1,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Card(
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                        // model.thumbnail != null
                        //     ? NetworkImage(model.thumbnail.path +
                        //     "." +
                        //     model.thumbnail.extension)
                        //     :
                        NetworkImage(
                            "https://abrakadabra.vteximg.com.br/arquivos/ids/235915/banner_640x500_hotsite_marvel.jpg?v=637302469381230000"),
                      ),
                    ),
                  ),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              Tooltip(
                message: "dfsd",
                child: Text(
                  "dfsdfsd",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.none),
                ),
              ),
            ],
          ),
        ));
  }

}