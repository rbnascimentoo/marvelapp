import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:marvelapp/application/config.dart';
import 'package:marvelapp/ui/widget/list_marvel.dart';

//Principal Screen
class MarvelApp extends StatefulWidget {
  @override
  _MarvelState createState() => _MarvelState();
}

class _MarvelState extends State<MarvelApp> {
  @override
  Widget build(BuildContext context) {

    //Set Configurations
    var config = Config();

    return MaterialApp(
        title: 'Marvel App',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        //Loading screen
        //TODO utilizar route
        home: LoaderOverlay(
          overlayWidget: Center(
            child: SpinKitSquareCircle(
              color: Colors.blueAccent,
              size: 50,
            ),
          ),
          overlayOpacity: 0.8,
          child: ListMarvel(),
        ));
  }
}
