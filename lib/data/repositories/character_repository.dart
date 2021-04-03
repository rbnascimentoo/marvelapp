import 'package:marvelapp/data/services/marvel_service.dart';

class CharactersRepository {

  final MarvelService marvelService;

  CharactersRepository(this.marvelService);

  Future<dynamic> getCharacters(int offsetQParam) async {
    return await marvelService.getCharacters(offsetQParam);
  }

}