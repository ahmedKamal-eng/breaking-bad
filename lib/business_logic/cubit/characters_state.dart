
import 'package:flutter/material.dart';

import '../../data/models/characters.dart';

@immutable
abstract class CharactersState{}

class CharacterInitial extends CharactersState{}

class CharacterLoadError extends CharactersState{}

class CharactersLoad extends CharactersState{
  // final List<Character> characters;

  // CharactersLoad(this.characters);
}

class SearchedCharacter extends CharactersState{}