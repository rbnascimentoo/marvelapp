import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/application/config.dart';
import 'package:marvel_app/ui/widget/list_marvel.dart';

class MarvelDetail extends StatefulWidget {

  @override
  _MarvelDetailState createState() => _MarvelDetailState();

}

class _MarvelDetailState extends State<MarvelDetail> {

  @override
  Widget build(BuildContext context) {

    var config = Config();

    return MaterialApp(
      title: 'Marvel App Detail',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(child: Text("DETAIL"),),
    );
  }
}