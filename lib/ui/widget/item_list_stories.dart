import 'package:flutter/material.dart';
import 'package:marvelapp/models/stories_response.dart';

class ItemListStories extends StatelessWidget {

  Stories stories;

  ItemListStories(this.stories);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('containerItemListCarouselDetailsStories${stories.id}'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            key: Key('cardItemListCarouselDetailsStories${stories.id}'),
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: stories != null && stories.thumbnail != null
                          ? NetworkImage(stories.thumbnail.path +
                              "." +
                              stories.thumbnail.extension)
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
            message: stories != null ? stories.title : 'No Title',
            child: Text(
              stories != null ? stories.title : 'No Title',
              key: Key('textTitleCardDetail${stories.title}'),
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
