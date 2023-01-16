import 'package:rick_and_morty/core/typedef/error_or.dart';
import 'package:rick_and_morty/domain/entities/search_filter.dart';

import '../entities/character.dart';
import '../entities/character_card.dart';
import '../entities/response.dart';

abstract class ICharacterRepository {
  Future<ErrorOr<Response<CharacterCard>>> getCharacters({int? page});

  Future<ErrorOr<Character>> getCharacterById(int id);

  Future<ErrorOr<Response<CharacterCard>>> getCharactersByName(String name);

  Future<ErrorOr<Response<CharacterCard>>> getCharactersByFilter(
      SearchFilter<CharacterFilter> filter);
}
