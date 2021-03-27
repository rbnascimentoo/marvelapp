import 'package:flutter/services.dart';

class Config {

  Config(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
  }

}