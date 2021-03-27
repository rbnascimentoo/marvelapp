
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/application/config.dart';
import 'package:marvel_app/ui/widget/list_marvel.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: ListMarvel(),
    );
  }
}