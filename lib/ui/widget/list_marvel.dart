import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:marvelapp/bloc/character_bloc.dart';
import 'package:marvelapp/models/marvel_base_response.dart';
import 'package:marvelapp/ui/widget/item_list_marvel.dart';

//Widget principal screen
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
        key: Key('textShowLoaderInit'),
        style: TextStyle(color: Colors.blueAccent),
      ),
    );

    characterBloc.getList(null, limitQParam: limit, offsetQParam: offset);

    return Container(
      key: Key('containerPrincipal'),
      color: Colors.red,
      child: StreamBuilder<ContainerData>(
        key: Key('StreamBuilderListMarvel'),
        stream: characterBloc.output,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            context.hideLoaderOverlay();
            return Container(
              key: Key('containerEmptyListMarvel'),
              child: Text(
                "Não há registros!",
                key: Key('textNoDataListMarvel'),
                style: TextStyle(
                  decoration: TextDecoration.none,
                ),
              ),
            );
          }

          if (!snapshot.hasData) {
            context.showLoaderOverlay(
              widget: Text(
                "Loading...",
                key: Key('textShowLoaderPrincipalLoading'),
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
            );
            return Container(
              key: Key('containerNullListMarvel'),
              color: Colors.red,
            );
          }

          context.hideLoaderOverlay();
          return Container(
            key: Key('containerListMarvel'),
            child: CarouselSlider(
              key: Key('carouselListMarvel'),
              carouselController: _controllerCarousel,
              items: snapshot.data.results
                  .map((e) => Column(
                        key: Key('columnItemListMarvel${e.id}'),
                        children: [
                          ItemListMarvel(character: e),
                        ],
                      ))
                  .toList(),
              options: CarouselOptions(
                height: (MediaQuery.of(context).size.height),
                enlargeCenterPage: true,
                autoPlayCurve: Curves.slowMiddle,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) async {
                  if (index == snapshot.data.results.length - 1 &&
                      snapshot.data.total > snapshot.data.count) {
                    context.showLoaderOverlay(
                      widget: Text(
                        "Loading...",
                        key: Key('textShowLoaderPageCarousel'),
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),
                      ),
                    );

                    offset += perPage;
                    limit += perPage;

                    await characterBloc.getList(null,
                        limitQParam: limit, offsetQParam: offset);

                    context.showLoaderOverlay(
                      widget: Text(
                        "Loading...",
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
