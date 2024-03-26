import 'package:bloc_app/business_logic/cubit/characters_cubit.dart';
import 'package:bloc_app/data/repository/characters_repo.dart';
import 'package:bloc_app/data/web_services/characters_web_services.dart';
import 'package:bloc_app/presentation/screens/characters_details.dart';
import 'package:bloc_app/presentation/screens/characters_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/strings.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      CharactersCubit(charactersRepository),
                  child: const CharactersScreen(),
                ));
      case characterDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const CharacterDetailsScreen());
    }
  }
}
