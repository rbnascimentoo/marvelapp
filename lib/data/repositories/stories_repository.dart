import 'package:marvelapp/data/services/marvel_service.dart';
import 'package:marvelapp/utils/constants/message_constants.dart';

class StoriesRepository {

  final MarvelService marvelService;

  StoriesRepository(this.marvelService);

  Future<dynamic> getStories(String idCharacter, int limitQParam, int offsetQParam) async {
    return await marvelService.getStories(idCharacter, limitQParam, offsetQParam);
  }

}