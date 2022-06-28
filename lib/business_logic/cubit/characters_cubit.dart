

import 'package:bloc/bloc.dart';
import 'package:breaking_bad_app/business_logic/cubit/characters_state.dart';

import '../../data/models/characters.dart';
import '../../data/repository/characters_repository.dart';

class CharactersCubit extends Cubit<CharactersState>{
  final CharactersRepository charactersRepository;
  List<Character> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharacterInitial());

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      // emit(CharactersLoad(characters));

      this.characters = characters;
      emit(CharactersLoad());
    }).catchError((e){
      emit(CharacterLoadError());
    });

    return characters;
  }


  // Search section
List<Character> searchCharacter=[];

  void search({required String str}){
     searchCharacter= this.characters.where((character) => character.name.toLowerCase().startsWith(str)).toList();

  }





}