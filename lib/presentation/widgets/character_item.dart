import 'package:breaking_bad_app/constant/my_colors.dart';
import 'package:breaking_bad_app/constant/strings.dart';
import 'package:flutter/material.dart';

import '../../data/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        padding: EdgeInsetsDirectional.all(4),
        decoration: BoxDecoration(
          color: MyColors.myWhite,
        ),
        child: GridTile(
          child: Container(
            color: MyColors.myGrey,
            child: character.image.isNotEmpty
                ? Hero(
                 tag: '${character.name}',
                  child: FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: 'assets/images/loading.gif',
                      image: character.image),
                )
                : Image.asset('assets/images/placeholder.png'),
          ),
          footer: Container(
            color: MyColors.myGrey,
              width: double.infinity,
              padding: EdgeInsets.all(15),
              child: Text(character.name,style: TextStyle(fontWeight: FontWeight.bold,color: MyColors.myWhite),)),
        ),
      ),
      onTap: (){
        Navigator.pushNamed(context, characterDetailsRoute,arguments: character);
      },
    );
  }
}
