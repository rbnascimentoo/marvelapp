

import 'package:marvelapp/bloc/base_bloc.dart';
import 'package:marvelapp/data/repositories/character_repository.dart';
import 'package:marvelapp/data/repositories/comics_repository.dart';
import 'package:marvelapp/data/repositories/series_repository.dart';
import 'package:marvelapp/data/services/marvel_service.dart';
import 'package:marvelapp/models/character_response.dart';
import 'package:marvelapp/models/comic_response.dart';
import 'package:marvelapp/models/marvel_base_response.dart';
import 'package:marvelapp/models/series_response.dart';

class SeriesBloc extends BaseBloc<Set<Series>> {

  SeriesRepository seriesRepository;
  Set<Series> listSeries;

  SeriesBloc() {
    seriesRepository = SeriesRepository(MarvelService());
    listSeries = {};
  }
  
  @override
  getList(String idCharacter, {int limitQParam, int offsetQParam}) async {
    try {
      var result = await seriesRepository.getSeries(idCharacter, limitQParam, offsetQParam);
      MarvelBaseResponse response = MarvelBaseResponse.fromJsonToSeries(result);
      listSeries.addAll(response.data.results as Set<Series>);
      add(listSeries);
      return response.data;
    }catch (e) {
      return null;
    }
  }

}