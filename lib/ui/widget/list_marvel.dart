import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvelapp/bloc/character_bloc.dart';
import 'package:marvelapp/models/character_response.dart';
import 'package:marvelapp/ui/widget/item_list_marvel.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ListMarvel extends StatelessWidget {
  CharacterBloc characterBloc = CharacterBloc();

  int offset = 0;
  int limit = 20;
  int perPage = 20;

  ListMarvel();

  @override
  Widget build(BuildContext context) {
    final CarouselController _controllerCarousel = CarouselController();

    context.showLoaderOverlay(
      widget: Text(
        "Loading...",
        style: TextStyle(color: Colors.blueAccent),
      ),
    );

    characterBloc.getList(null, limitQParam: limit, offsetQParam: offset);

    return Container(
      color: Colors.red,
      child: StreamBuilder<List<Character>>(
        stream: characterBloc.output,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            context.hideLoaderOverlay();
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
            context.showLoaderOverlay(
              widget: Text(
                "Loading...",
                style: TextStyle(color: Colors.blueAccent),
              ),
            );
            return Container(
              color: Colors.red,
            );
          }

          context.hideLoaderOverlay();
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
                    onPageChanged: (index, reason) async {
                      if (index == snapshot.data.length - 1) {

                        context.showLoaderOverlay(
                          widget: Text(
                            "Loading...",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        );

                        offset = offset + perPage;
                        limit = limit + perPage;
                        characterBloc.getList(null,
                            limitQParam: limit, offsetQParam: offset);

                        context.showLoaderOverlay(
                          widget: Text(
                            "Loading...",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
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
