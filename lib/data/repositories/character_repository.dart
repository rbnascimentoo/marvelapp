import 'package:marvelapp/data/services/marvel_service.dart';
import 'package:marvelapp/utils/constants/message_constants.dart';

class CharactersRepository {

  final MarvelService marvelService;

  CharactersRepository(this.marvelService);

  Future<dynamic> getCharacters(int limitQParam, int offsetQParam) async {
    return await marvelService.getCharacters(limitQParam, offsetQParam);
  }

}