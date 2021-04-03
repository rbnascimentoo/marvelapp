import 'package:marvelapp/data/services/marvel_service.dart';

class SeriesRepository {

  final MarvelService marvelService;

  SeriesRepository(this.marvelService);

  Future<dynamic> getSeries(String idCharacter, int offsetQParam) async {
    return await marvelService.getSeries(idCharacter, offsetQParam);
  }

}