
import 'package:marvel_app/bloc/base_bloc.dart';
import 'package:marvel_app/data/repositories/character_repository.dart';
import 'package:marvel_app/data/services/marvel_service.dart';
import 'package:marvel_app/models/marvel_base_response.dart';

class CharacterBloc extends BaseBloc<ContainerData> {

  CharactersRepository charactersRepository;

  CharacterBloc() {
    charactersRepository = CharactersRepository(MarvelService());
  }

  getCharacters() async {
    try {
      var result = await charactersRepository.getCharacters();
      MarvelBaseResponse response = MarvelBaseResponse.fromJson(result);
      add(response.data);
      return response.data;
    }catch (e) {
      return null;
    }
  }

}