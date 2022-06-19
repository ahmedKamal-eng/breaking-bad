

import 'package:bloc/bloc.dart';
import 'package:breaking_bad_app/business_logic/cubit/characters_state.dart';

import '../../data/models/characters.dart';
import '../../data/repository/characters_repository.dart';

class CharactersCubit extends Cubit<CharactersState>{
  final CharactersRepository charactersRepository;
  late List<Character> characters;

  CharactersCubit(this.charactersRepository):super(CharacterInitial());

  List<Character> getAllCharacters(){
    charactersRepository.getAllCharacters().then((character) {
      emit(CharactersLoad(characters));
      this.characters =character;
    });
    return characters;
  }





}