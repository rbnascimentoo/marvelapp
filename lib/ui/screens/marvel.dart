
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvelapp/application/config.dart';
import 'package:marvelapp/ui/widget/list_marvel.dart';

class MarvelApp extends StatefulWidget {

  @override
  _MarvelState createState() => _MarvelState();

}

class _MarvelState extends State<MarvelApp> {

  @override
  Widget build(BuildContext context) {

    var config = Config();
    
    return MaterialApp(
      title: 'Marvel App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => ListMarvel(),
      // },
      home: ListMarvel(),
    );
  }
}