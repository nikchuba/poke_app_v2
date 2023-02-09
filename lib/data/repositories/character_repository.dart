import 'package:rick_and_morty/core/repository_helper.dart';
import 'package:rick_and_morty/core/typedef/either.dart';
import 'package:rick_and_morty/data/data_sources/remote/rest_api/character_service.dart';
import 'package:rick_and_morty/data/mappers/character_mapper.dart';
import 'package:rick_and_morty/data/mappers/enum_mapper.dart';
import 'package:rick_and_morty/data/models/character_filter_dto.dart';
import 'package:rick_and_morty/domain/entities/pagination.dart';

import 'package:rick_and_morty/domain/entities/character_card.dart';

import 'package:rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/domain/entities/search_filter.dart';
import 'package:rick_and_morty/domain/repositories/character_repository.dart';

class CharacterRepository
    with RepositoryHelper
    implements ICharacterRepository {
  const CharacterRepository({
    required CharacterService service,
  }) : _service = service;

  final CharacterService _service;

  @override
  Future<ErrorOr<Character>> getCharacterById(int id) async {
    return requestParser(
      request: () => _service.getCharacterById(id),
      parser: mapCharacter,
    );
  }

  @override
  Future<ErrorOr<Pagination<CharacterCard>>> getCharacters({
    int? page,
  }) {
    return requestParser(
      request: () => _service.getCharacters(page),
      parser: mapCharacterPagination,
    );
  }

  @override
  Future<ErrorOr<Pagination<CharacterCard>>> getCharactersByFilter(
    SearchFilter<CharacterFilter> filter,
  ) async {
    return requestParser(
      request: () => _service.getCharactersByFilter(
        CharacterFilterDto(
          name: filter.filter.name,
          species: filter.filter.species,
          type: filter.filter.type,
          status: mapStatusDto(filter.filter.status),
          gender: mapGenderDto(filter.filter.gender),
        ),
      ),
      parser: mapCharacterPagination,
    );
  }

  @override
  Future<ErrorOr<Pagination<CharacterCard>>> getCharactersByName(
    String name,
  ) async {
    return requestParser(
      request: () => _service.getCharacterByName(name),
      parser: mapCharacterPagination,
    );
  }
}
