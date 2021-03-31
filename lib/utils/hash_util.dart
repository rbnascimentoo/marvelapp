import 'dart:math';

class HashUtil {

  static Random random = Random();

  static String generateTsRandom() {

    String randomHash = "";

    for (var i = 0; i < 5; i++) {
      randomHash += random.nextInt(100).toString();
    }

    return randomHash.toString();
  }


}