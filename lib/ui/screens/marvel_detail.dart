import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvelapp/bloc/comics_bloc.dart';
import 'package:marvelapp/bloc/series_bloc.dart';
import 'package:marvelapp/bloc/stories_bloc.dart';
import 'package:marvelapp/models/character_response.dart';
import 'package:marvelapp/models/comic_response.dart';
import 'package:marvelapp/models/series_response.dart';
import 'package:marvelapp/models/stories_response.dart';
import 'package:marvelapp/ui/widget/carousel_marvel.dart';

//Second screen - details characters marvel
class MarvelDetail extends StatefulWidget {
  Character character;

  MarvelDetail(this.character);

  @override
  _MarvelDetailState createState() => _MarvelDetailState();
}

class _MarvelDetailState extends State<MarvelDetail> {

  @override
  Widget build(BuildContext context) {

    bool existDescription = widget.character.description != null && widget.character.description.isNotEmpty;

    return Scaffold(
      key: Key('scaffoldDetailItemListMarvel${widget.character.id}'),
      appBar: AppBar(
        key: Key('appBarDetailItem${widget.character.id}'),
        title: Text(
          widget.character.name,
          key: Key('textTitle${widget.character.id}'),
        ),
        actions: [
          Hero(
            key: Key('heroDetailItemList${widget.character.id}'),
            tag: widget.character.id,
            child: Container(
              key: Key('containerHeroDetail${widget.character.id}'),
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: widget.character.thumbnail != null
                      ? NetworkImage(widget.character.thumbnail.path +
                          "." +
                          widget.character.thumbnail.extension)
                      : NetworkImage(
                          "https://abrakadabra.vteximg.com.br/arquivos/ids/235915/banner_640x500_hotsite_marvel.jpg?v=637302469381230000"),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
          key: Key('containerBodyDetail${widget.character.id}'),
          padding: EdgeInsets.all(10),
          height: (MediaQuery.of(context).size.height),
          child: ListView(
            key: Key('listViewDetail${widget.character.id}'),
            children: [
              existDescription ?
              Text(
                widget.character.description,
                key: Key('textDescriptionDetail${widget.character.id}'),
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ) : Text(''),
              SizedBox(
                key: Key('sizeBoxComics${widget.character.id}'),
                height: existDescription ? 50 : 0,
              ),
              CarouselMarvel<Comics>(
                idCharacter: widget.character.id.toString(),
                bloc: ComicsBloc(),
                title: 'Comics',
              ),
              SizedBox(
                height: 1,
              ),
              CarouselMarvel<Series>(
                idCharacter: widget.character.id.toString(),
                bloc: SeriesBloc(),
                title: 'Series',
              ),
              SizedBox(
                height: 1,
              ),
              CarouselMarvel<Stories>(
                idCharacter: widget.character.id.toString(),
                bloc: StoriesBloc(),
                title: 'Stories',
              ),
            ],
          ),
        ),
    );
  }
}
