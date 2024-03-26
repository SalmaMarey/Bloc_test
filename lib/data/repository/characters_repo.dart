import 'package:bloc_app/data/models/characters.dart';
import 'package:bloc_app/data/web_services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  Future<List<Results>> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters.map((character) => Results.fromJson(character)).toList();
  }
}
