import 'package:marvelapp/data/services/marvel_service.dart';

class StoriesRepository {

  final MarvelService marvelService;

  StoriesRepository(this.marvelService);

  Future<dynamic> getStories(String idCharacter, int offsetQParam) async {
    return await marvelService.getStories(idCharacter, offsetQParam);
  }

}