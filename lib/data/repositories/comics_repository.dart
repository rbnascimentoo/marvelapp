import 'package:marvelapp/data/services/marvel_service.dart';
import 'package:marvelapp/utils/constants/message_constants.dart';

class ComicsRepository {

  final MarvelService marvelService;

  ComicsRepository(this.marvelService);

  Future<dynamic> getComics(String idCharacter, int offsetQParam) async {
    return await marvelService.getComics(idCharacter, offsetQParam);
  }

}