
import 'package:marvelapp/utils/constants/message_constants.dart';
import 'package:marvelapp/utils/enums/type_rest.dart';
import 'package:marvelapp/utils/service_http_util.dart';


class MarvelService {

  Future<dynamic> getCharacters(int limitQParam , int offsetQParam) async {
    return await ServiceHttpUtil.callService(
        true,
        MessageConstants.MARVEL_HOST,
        TypeRest.GET,
        MessageConstants.MARVEL_CHARACTERS_PATH,
        qParam: {'limit' : limitQParam.toString(), 'offset' :  offsetQParam.toString()});

  }

  Future<dynamic> getComics(String idCharacter, int limitQParam , int offsetQParam) async {
    return await ServiceHttpUtil.callService(
        true,
        MessageConstants.MARVEL_HOST,
        TypeRest.GET,
        MessageConstants.MARVEL_CHARACTERS_PATH + '/' + idCharacter + MessageConstants.MARVEL_COMICS_PATH,
        qParam: {'limit' : limitQParam.toString(), 'offset' :  offsetQParam.toString()});

  }


}