import 'dart:js';

import 'package:breaking_bad_app/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad_app/constant/strings.dart';
import 'package:breaking_bad_app/data/repository/characters_repository.dart';
import 'package:breaking_bad_app/data/web_services/characters_web_services.dart';
import 'package:breaking_bad_app/presentation/screens/characters_details_screen.dart';
import 'package:breaking_bad_app/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {

 late CharactersRepository charactersRepository;
 late CharactersCubit charactersCubit;

 AppRouter(){
   charactersRepository=CharactersRepository(CharactersWebServices());
   charactersCubit=CharactersCubit(charactersRepository);
 }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case allCharacterRoute:
        return MaterialPageRoute(builder: (_) => BlocProvider(create: (context){
          return charactersCubit;
        },
        child: CharactersScreen(),
        ));
      case characterDetailsRoute:
        return MaterialPageRoute(builder: (_)=>CharactersDetailsScreen());
    }
  }
}
