import 'package:rick_and_morty/core/typedef/either.dart';
import 'package:rick_and_morty/domain/entities/search_filter.dart';

import '../entities/character.dart';
import '../entities/character_card.dart';
import '../entities/pagination.dart';

abstract class ICharacterRepository {
  Future<ErrorOr<Pagination<CharacterCard>>> getCharacters({int? page});

  Future<ErrorOr<Character>> getCharacterById(int id);

  Future<ErrorOr<List<CharacterCard>>> getCharacterCardsByIds(List<int> ids);

  Future<ErrorOr<Pagination<CharacterCard>>> getCharactersByName(String name);

  Future<ErrorOr<Pagination<CharacterCard>>> getCharactersByFilter(
      SearchFilter<CharacterFilter> filter);
}
