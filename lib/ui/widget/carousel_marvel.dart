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
  String title;

  int offset = 0;
  int limit = 20;
  int perPage = 20;

  CarouselMarvel({this.idCharacter, this.bloc, this.title});

  @override
  Widget build(BuildContext context) {
    CarouselController _controllerCarousel = CarouselController();

    bloc.getList(idCharacter, offsetQParam: offset);

    return Container(
        key: Key('containerCarouselDetailItem$idCharacter'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              key: Key('textComicsDetail$idCharacter}'),
              textAlign: TextAlign.right,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            StreamBuilder<Set<T>>(
              key: Key('streamBuilderDetailItem$idCharacter'),
              stream: bloc.output,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    key: Key('containerErrorDetail'),
                    child: Text(
                      "Não há registros!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                      ),
                    ),
                  );
                }

                if (!snapshot.hasData) {
                  return Center(
                    key: Key('centerCircularProgressIndicador'),
                    child: CircularProgressIndicator(
                      key: Key('circularProgressIndicadorNoData'),
                      backgroundColor: Colors.blueAccent,
                    ),
                  );
                }

                return Container(
                  child: CarouselSlider(
                    // key: Key('carouselDetails$idCharacter-$title'),
                    carouselController: _controllerCarousel,
                    items: snapshot.data.map((e) {
                      if (e is Comics) {
                        return ItemListComics(e);
                      }

                      if (e is Series) {
                        return ItemListSeries(e);
                      }

                      if (e is Stories) {
                        return ItemListStories(e);
                      }
                    }).toList(),
                    options: CarouselOptions(
                      height: 300,
                      enlargeCenterPage: true,
                      autoPlayCurve: Curves.slowMiddle,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) async {
                        if (index == snapshot.data.length - 3 &&
                            snapshot.data.length >= 19) {

                          Center(
                            key: Key('centerCircularProgressIndicador'),
                            child: CircularProgressIndicator(
                              key: Key('circularProgressIndicadorNoData'),
                              backgroundColor: Colors.blueAccent,
                            ),
                          );

                          offset += perPage;
                          limit += perPage;

                          bloc.getList(idCharacter, offsetQParam: offset);
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
    );
  }
}
