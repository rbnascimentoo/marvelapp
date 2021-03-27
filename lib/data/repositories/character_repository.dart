import 'package:marvel_app/data/services/marvel_service.dart';

class CharactersRepository {

  final MarvelService marvelService;

  CharactersRepository(this.marvelService);

  Future<dynamic> getCharacters() async {
    return await marvelService.getCharacters();
  }

}