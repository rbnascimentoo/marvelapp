

import 'package:marvelapp/bloc/base_bloc.dart';
import 'package:marvelapp/data/repositories/character_repository.dart';
import 'package:marvelapp/data/repositories/comics_repository.dart';
import 'package:marvelapp/data/services/marvel_service.dart';
import 'package:marvelapp/models/character_response.dart';
import 'package:marvelapp/models/comic_response.dart';
import 'package:marvelapp/models/marvel_base_response.dart';

class ComicsBloc extends BaseBloc<Set<Comics>> {

  ComicsRepository comicsRepository;
  Set<Comics> listComics;

  ComicsBloc() {
    comicsRepository = ComicsRepository(MarvelService());
    listComics = {};
  }
  
  @override
  getList(String idCharacter, {int offsetQParam}) async {
    try {
      var result = await comicsRepository.getComics(idCharacter, offsetQParam);
      MarvelBaseResponse response = MarvelBaseResponse.fromJsonToComics(result);
      listComics.addAll(response.data.results as Set<Comics>);
      add(listComics);
      return response.data;
    }catch (e) {
      return null;
    }
  }

}