import 'package:breaking_bad_app/constant/my_colors.dart';
import 'package:flutter/material.dart';

import '../../data/models/characters.dart';
class CharactersDetailsScreen extends StatelessWidget {
  const CharactersDetailsScreen({Key? key,required this.character}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: SafeArea(
        child: Container(
          child: Text(character.name),
        ),
      ),
    );
  }
}
