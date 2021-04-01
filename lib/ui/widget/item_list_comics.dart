import 'package:flutter/material.dart';
import 'package:marvelapp/models/comic_response.dart';

class ItemListComics extends StatelessWidget {
  Comics comics;

  ItemListComics(this.comics);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('containerItemListCarouselDetailsComics${comics.id}'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            key: Key('cardItemListCarouselDetailsComics${comics.id}'),
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: comics != null && comics.thumbnail != null
                          ? NetworkImage(comics.thumbnail.path +
                              "." +
                              comics.thumbnail.extension)
                      : NetworkImage(
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
            key: Key('tooltipTitleCardDetail'),
            message: comics != null ? comics.title : 'No Title',
            child: Text(
              comics != null ? comics.title : 'No Title',
              key: Key('textTitleCardDetail${comics.title}'),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
          ),
        ],
      ),
    );
  }
}
