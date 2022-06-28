import 'package:breaking_bad_app/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad_app/business_logic/cubit/characters_state.dart';
import 'package:breaking_bad_app/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/my_colors.dart';
import '../../data/models/characters.dart';
import '../widgets/character_item.dart';

class SearchScreen extends StatefulWidget {
   SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchFieldController =TextEditingController();

  // List<Character> searchedCharacters=[];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit,CharactersState>(builder: (context,state)

     { return Scaffold(
        appBar: AppBar(
          leading: IconButton(
             onPressed: (){
               _searchFieldController.clear();
               Navigator.pop(context);
             },
            icon:Icon( Icons.arrow_back),
          ),
          backgroundColor: MyColors.myYellow,
          title: TextField(
            controller: _searchFieldController,
            cursorColor: MyColors.myGrey,
            onChanged: (s) {
              doSearch(s, context);
            },
            // onSubmitted: (s){
            //   doSearch(s, context);
            // },
          ),


        ),
         body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                buildSearchedList(context)
              ],
            ),
          ),
        )
      );
  });
  }
  void doSearch (String s,context){

    BlocProvider.of<CharactersCubit>(context).search(str: s);
    setState((){});

  }

  @override
  void dispose(){
    _searchFieldController.dispose();
    super.dispose();

  }

}

Widget buildSearchedList(context){
    List<Character> searchedList=BlocProvider.of<CharactersCubit>(context).searchCharacter;
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
      return  CharacterItem(character: searchedList[index],);
    },
    itemCount: searchedList.length,
  );
  
    
}

