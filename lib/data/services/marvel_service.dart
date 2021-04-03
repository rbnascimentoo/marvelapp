import 'package:marvelapp/utils/constants/message_constants.dart';
import 'package:marvelapp/utils/enums/type_rest.dart';
import 'package:marvelapp/utils/service_http_util.dart';

class MarvelService {
  Future<dynamic> getCharacters(int offsetQParam) async {
    try {
      return await ServiceHttpUtil.callService(
          true,
          MessageConstants.MARVEL_HOST,
          TypeRest.GET,
          MessageConstants.MARVEL_CHARACTERS_PATH,
          qParam: {'offset': offsetQParam.toString()});
    } catch (e) {
      return '{}';
    }
  }

  Future<dynamic> getComics(String idCharacter, int offsetQParam) async {
    try {
      return await ServiceHttpUtil.callService(
          true,
          MessageConstants.MARVEL_HOST,
          TypeRest.GET,
          MessageConstants.MARVEL_CHARACTERS_PATH +
              '/' +
              idCharacter +
              MessageConstants.MARVEL_COMICS_PATH,
          qParam: {'offset': offsetQParam.toString()});
    } catch (e) {
      return '{}';
    }
  }

  Future<dynamic> getStories(String idCharacter, int offsetQParam) async {
    try {
      return await ServiceHttpUtil.callService(
          true,
          MessageConstants.MARVEL_HOST,
          TypeRest.GET,
          MessageConstants.MARVEL_CHARACTERS_PATH +
              '/' +
              idCharacter +
              MessageConstants.MARVEL_STORIES_PATH,
          qParam: {'offset': offsetQParam.toString()});
    } catch (e) {
      return '{}';
    }
  }

  Future<dynamic> getSeries(String idCharacter, int offsetQParam) async {
    try {
      return await ServiceHttpUtil.callService(
          true,
          MessageConstants.MARVEL_HOST,
          TypeRest.GET,
          MessageConstants.MARVEL_CHARACTERS_PATH +
              '/' +
              idCharacter +
              MessageConstants.MARVEL_SERIES_PATH,
          qParam: {'offset': offsetQParam.toString()});
    } catch (e) {
      return '{}';
    }
  }
}
