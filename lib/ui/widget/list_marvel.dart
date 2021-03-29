import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/bloc/character_bloc.dart';
import 'package:marvel_app/models/marvel_base_response.dart';
import 'package:marvel_app/ui/widget/item_list_marvel.dart';

class ListMarvel extends StatelessWidget {
  CharacterBloc characterBloc = CharacterBloc();

  ListMarvel();

  @override
  Widget build(BuildContext context) {
    characterBloc.getCharacters();

    return Container(
      color: Colors.red,
      child: StreamBuilder<ContainerData>(
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

          return CarouselSlider(
            items: snapshot.data.results
                .map((e) => Column(
                      children: [ItemListMarvel(character: e)],
                    ))
                .toList(),
            options: CarouselOptions(
              height: 600.0,
              enlargeCenterPage: true,
              autoPlay: false,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.slowMiddle,
              enableInfiniteScroll: false,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          );
        },
      ),
    );
  }
}
