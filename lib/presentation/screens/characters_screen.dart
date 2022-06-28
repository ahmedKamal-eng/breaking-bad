import 'package:breaking_bad_app/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad_app/business_logic/cubit/characters_state.dart';
import 'package:breaking_bad_app/constant/my_colors.dart';
import 'package:breaking_bad_app/constant/strings.dart';
import 'package:breaking_bad_app/presentation/screens/search_screen.dart';
import 'package:breaking_bad_app/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/characters.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
   List<Character> allCharacters =[];

  @override
 void initState()
 {
   super.initState();
   BlocProvider.of<CharactersCubit>(context).getAllCharacters();
 }
 Widget buildBlocWidget(){
    return BlocBuilder<CharactersCubit,CharactersState>(builder: (context,state){
       if(state is CharacterLoadError)
         {
           return Center(
             child: CircularProgressIndicator(
               color: MyColors.myYellow,
             ),
           );

         }else
           {
             // allCharacters = (state).characters;
             allCharacters=BlocProvider.of<CharactersCubit>(context).characters;
             return buildLoadedList();
           }
    },);
 }

 Widget buildLoadedList(){
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            buildCharactersList()
          ],
        ),
      ),
    );
 }

 Widget buildCharactersList(){
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
      childAspectRatio: 2/3,
    ),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics:  const ClampingScrollPhysics(),
        itemBuilder: (context,index){
     return  CharacterItem(character: allCharacters[index],);
    },
    itemCount: allCharacters.length,
    );
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: Text('characters',style: TextStyle(color: MyColors.myGrey),),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, searchRoute);
          }, icon:Icon( Icons.search))
        ],
      ),
    body: buildBlocWidget() ,
    );
  }
}
