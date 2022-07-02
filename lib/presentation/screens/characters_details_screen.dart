import 'package:breaking_bad_app/constant/my_colors.dart';
import 'package:flutter/material.dart';

import '../../data/models/characters.dart';

class CharactersDetailsScreen extends StatelessWidget {
  const CharactersDetailsScreen({Key? key, required this.character})
      : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${character.name}'),
          backgroundColor: MyColors.myYellow,
        ),
        backgroundColor: MyColors.myGrey,
        body: Column(
          children: [
            Container(
              height: 200,
              width: 150,
              child: Hero(
                tag: '${character.name}',
                child: Image.network(
                  '${character.image}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            buildData('JOB','${character.jobs[0]}'),
            buildData('Appeared In','${character.categoryForTwoSeries}'),
            buildData('Seasons','${character.appearanceOfSeasons}'),
            buildData('Status','${character.statusIfDeadOrAlive}'),
            buildData('Actor/Actress','${character.acotrName}'),


          ],
        ));
  }
}

buildData(String main,String val){
  return  Padding(
    padding: const EdgeInsets.all(18),
    child: Row(
      children: [
        Text(
          '$main:',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: MyColors.myWhite,
              fontSize: 25),
        ),
        Expanded(
          child: Text('${val}',
              maxLines: 1,
              style: TextStyle(
                  color: MyColors.myWhite,
                  fontSize: 25,
                  overflow: TextOverflow.ellipsis)),
        )
      ],
    ),
  );
}