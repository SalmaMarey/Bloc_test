import 'package:bloc/bloc.dart';
import 'package:bloc_app/data/models/characters.dart';
import 'package:bloc_app/data/repository/characters_repo.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  getAllCharacters() async {
    try {
      final characters = await charactersRepository.getAllCharacters();
      emit(CharactersLoaded(characters));
    } catch (e) {
      // Handle error
    }
  }
}
