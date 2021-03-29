import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvelapp/bloc/character_bloc.dart';
import 'package:marvelapp/models/character_response.dart';
import 'package:marvelapp/ui/widget/item_list_marvel.dart';

class ListMarvel extends StatelessWidget {
  CharacterBloc characterBloc = CharacterBloc();

  int offset = 0;
  int limit = 20;

  ListMarvel();

  @override
  Widget build(BuildContext context) {

    final CarouselController _controllerCarousel = CarouselController();

    characterBloc.getList(null, limitQParam: limit, offsetQParam: offset);

    return Container(
      color: Colors.red,
      child: StreamBuilder<List<Character>>(
        stream: characterBloc.output,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Não há registros!",
                  style: TextStyle(decoration: TextDecoration.none),
                ),
              ],
            );
          }

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blueAccent,
              ),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                CarouselSlider(
                  carouselController: _controllerCarousel,
                  items: snapshot.data
                      .map((e) => Column(
                            children: [ItemListMarvel(character: e)],
                          ))
                      .toList(),
                  options: CarouselOptions(
                    initialPage: 0,
                    height: (MediaQuery.of(context).size.height),
                    enlargeCenterPage: true,
                    autoPlay: false,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: false,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      if (index == snapshot.data.length - 1) {
                        CircularProgressIndicator(
                          backgroundColor: Colors.blueAccent,
                        );
                        offset = offset + limit;
                        limit = limit + limit;
                        characterBloc.getList(null, limitQParam: limit, offsetQParam: offset);
                        CircularProgressIndicator(
                          backgroundColor: Colors.blueAccent,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
