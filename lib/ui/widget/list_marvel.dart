import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/bloc/character_bloc.dart';
import 'package:marvel_app/models/marvel_base_response.dart';
import 'package:marvel_app/ui/widget/item_list_marvel.dart';

class ListMarvel extends StatelessWidget {

  CharacterBloc characterBloc = CharacterBloc();

  ListMarvel();

  _onPress(int id) {
    // characterBloc.getCharacter(id);
    print(id);
  }

  @override
  Widget build(BuildContext context) {
    characterBloc.getCharacters();

    return Container(
      color: Colors.red,
      child: StreamBuilder<ContainerData>(

        stream: characterBloc.output,
        builder: (context, snapshot) {

          if(snapshot.hasError || !snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                  Text("Não há registros!"),
              ],
            );
          }

          return CarouselSlider(
                items:
                  snapshot.data.results.map((e) => Column(
                    children: [
                      ItemListMarvel(character: e, callback: _onPress)
                    ],
                  )).toList(),
                options: CarouselOptions(
                    height: 550.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
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
