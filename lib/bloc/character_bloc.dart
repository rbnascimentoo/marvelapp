

import 'package:marvelapp/models/character_response.dart';
import 'package:marvelapp/bloc/base_bloc.dart';
import 'package:marvelapp/data/repositories/character_repository.dart';
import 'package:marvelapp/data/services/marvel_service.dart';
import 'package:marvelapp/models/marvel_base_response.dart';
import 'package:marvelapp/utils/constants/message_constants.dart';

class CharacterBloc extends BaseBloc<List<Character>> {

  CharactersRepository charactersRepository;
  List<Character> listCharacter;

  CharacterBloc() {
    charactersRepository = CharactersRepository(MarvelService());
    listCharacter = [];
  }

  @override
  getList(String idCharacter, {int limitQParam, int offsetQParam}) async {
    try {
      var result = await charactersRepository.getCharacters(limitQParam, offsetQParam);
      MarvelBaseResponse<Character> response = MarvelBaseResponse<Character>.fromJson(result);
      listCharacter.addAll(response.data.results);
      add(listCharacter);
      return response.data;
    }catch (e) {
      return null;
    }
  }

}