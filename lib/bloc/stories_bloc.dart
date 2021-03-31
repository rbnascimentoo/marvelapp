

import 'package:marvelapp/bloc/base_bloc.dart';
import 'package:marvelapp/data/repositories/character_repository.dart';
import 'package:marvelapp/data/repositories/comics_repository.dart';
import 'package:marvelapp/data/repositories/stories_repository.dart';
import 'package:marvelapp/data/services/marvel_service.dart';
import 'package:marvelapp/models/character_response.dart';
import 'package:marvelapp/models/comic_response.dart';
import 'package:marvelapp/models/marvel_base_response.dart';
import 'package:marvelapp/models/stories_response.dart';

class StoriesBloc extends BaseBloc<List<Stories>> {

  StoriesRepository storiesRepository;
  List<Stories> listStories;

  StoriesBloc() {
    storiesRepository = StoriesRepository(MarvelService());
    listStories = [];
  }
  
  @override
  getList(String idCharacter, {int limitQParam, int offsetQParam}) async {
    try {
      var result = await storiesRepository.getStories(idCharacter, limitQParam, offsetQParam);
      MarvelBaseResponse response = MarvelBaseResponse.fromJsonToStories(result);
      listStories.addAll(response.data.results as List<Stories>);
      add(listStories);
      return response.data;
    }catch (e) {
      return null;
    }
  }

}