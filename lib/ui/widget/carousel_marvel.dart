import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvelapp/bloc/base_bloc.dart';
import 'package:marvelapp/models/comic_response.dart';
import 'package:marvelapp/models/series_response.dart';
import 'package:marvelapp/models/stories_response.dart';
import 'package:marvelapp/ui/widget/item_list_comics.dart';
import 'package:marvelapp/ui/widget/item_list_series.dart';
import 'package:marvelapp/ui/widget/item_list_stories.dart';

class CarouselMarvel<T> extends StatelessWidget {

  BaseBloc bloc;
  String idCharacter;
  int offset = 0;
  int limit = 20;

  CarouselMarvel({this.idCharacter, this.bloc});

  @override
  Widget build(BuildContext context) {
    CarouselController _controllerCarousel = CarouselController();

    bloc.getList(idCharacter, limitQParam: limit, offsetQParam: offset);

    return Container(
      child: StreamBuilder<List<T>>(
        stream: bloc.output,
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
                      .map((e) {
                        if(e is Comics) {
                          return ItemListComics(e);
                        }

                        if(e is Series) {
                          return ItemListSeries(e);
                        }

                        if(e is Stories) {
                          return ItemListStories(e);
                        }

                      })
                      .toList(),
                  options: CarouselOptions(
                    initialPage: 0,
                    height: 300,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: false,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.blueAccent,
                        ),
                      );
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
