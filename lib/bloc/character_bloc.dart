

import 'package:marvelapp/models/character_response.dart';
import 'package:marvelapp/bloc/base_bloc.dart';
import 'package:marvelapp/data/repositories/character_repository.dart';
import 'package:marvelapp/data/services/marvel_service.dart';
import 'package:marvelapp/models/marvel_base_response.dart';
import 'package:marvelapp/utils/constants/message_constants.dart';

class CharacterBloc extends BaseBloc<ContainerData> {

  CharactersRepository charactersRepository;
  ContainerData newContainerData;

  CharacterBloc() {
    charactersRepository = CharactersRepository(MarvelService());
    newContainerData = ContainerData(results: {});
  }

  @override
  getList(String idCharacter, {int offsetQParam}) async {
    try {
      var result = await charactersRepository.getCharacters(offsetQParam);
      MarvelBaseResponse response = MarvelBaseResponse.fromJsonToCharacter(result);
      newContainerData.results.addAll(response.data.results as Set<Character>);
      newContainerData.count = response.data.count;
      newContainerData.limit = response.data.limit;
      newContainerData.total = response.data.total;
      add(newContainerData);
      return newContainerData;
    }catch (e) {
      return null;
    }
  }

}