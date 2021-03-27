import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:marvel_app/utils/constants/message_constants.dart';
import 'package:marvel_app/utils/enums/type_rest.dart';
import 'package:marvel_app/utils/hash_util.dart';
import 'package:marvel_app/utils/service_http_util.dart';


class MarvelService {

  Future<dynamic> getCharacters() async {

    String ts = HashUtil.generateTsRandom();

    String hash = ts + MessageConstants.apikey2 + MessageConstants.apikey;

    var bytes = utf8.encode(hash);

    String md5Hash = md5.convert(bytes).toString();

    return await ServiceHttpUtil.callService(
        true,
        MessageConstants.MARVEL_HOST,
        TypeRest.GET,
        MessageConstants.MARVEL_CHARACTERS_PATH,
        qParam: {'ts' :  ts, 'apikey' : MessageConstants.apikey, 'hash' : md5Hash});

  }

}