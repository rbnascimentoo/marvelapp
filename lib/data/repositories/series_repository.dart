import 'package:marvelapp/data/services/marvel_service.dart';
import 'package:marvelapp/utils/constants/message_constants.dart';

class SeriesRepository {

  final MarvelService marvelService;

  SeriesRepository(this.marvelService);

  Future<dynamic> getSeries(String idCharacter, int limitQParam, int offsetQParam) async {
    return await marvelService.getSeries(idCharacter, limitQParam, offsetQParam);
  }

}