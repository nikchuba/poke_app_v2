import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rick_and_morty/core/error/error.dart';
import 'package:rick_and_morty/core/typedef/error_or.dart';
import 'package:rick_and_morty/data/data_sources/remote/rest_api/character_service.dart';
import 'package:rick_and_morty/data/mappers/character_mapper.dart';
import 'package:rick_and_morty/data/mappers/enum_mapper.dart';
import 'package:rick_and_morty/data/models/character_filter_dto.dart';
import 'package:rick_and_morty/domain/entities/pagination.dart';

import 'package:rick_and_morty/domain/entities/character_card.dart';

import 'package:rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/domain/entities/search_filter.dart';
import 'package:rick_and_morty/domain/repositories/character_repository.dart';

class CharacterRepository implements ICharacterRepository {
  const CharacterRepository({
    required CharacterService service,
  }) : _service = service;

  final CharacterService _service;

  @override
  Future<ErrorOr<Character>> getCharacterById(int id) async {
    return _requestWrapper(() async {
      final dto = await _service.getCharacterById(id);
      return compute(mapCharacter, dto);
    });
  }

  @override
  Future<ErrorOr<Pagination<CharacterCard>>> getCharacters({
    int? page,
  }) {
    return _requestWrapper<Pagination<CharacterCard>>(() async {
      final dto = await _service.getCharacters(page);
      return compute(mapCharacterResponse, dto);
    });
  }

  @override
  Future<ErrorOr<Pagination<CharacterCard>>> getCharactersByFilter(
    SearchFilter<CharacterFilter> filter,
  ) async {
    return _requestWrapper<Pagination<CharacterCard>>(() async {
      final dto = await _service.getCharactersByFilter(
        CharacterFilterDto(
          name: filter.filter.name,
          species: filter.filter.species,
          type: filter.filter.type,
          status: mapStatusDto(filter.filter.status),
          gender: mapGenderDto(filter.filter.gender),
        ),
      );
      return compute(mapCharacterResponse, dto);
    });
  }

  @override
  Future<ErrorOr<Pagination<CharacterCard>>> getCharactersByName(
    String name,
  ) async {
    return _requestWrapper<Pagination<CharacterCard>>(() async {
      final dto = await _service.getCharacterByName(name);
      return compute(mapCharacterResponse, dto);
    });
  }

  Future<ErrorOr<T>> _requestWrapper<T>(Future<T> Function() request) async {
    if (await InternetConnectionChecker().hasConnection) {
      try {
        final entity = await request();
        return Right(entity);
      } on dio.DioError catch (e) {
        return Left(ServerError(e.message));
      }
    }
    return const Left(NetworkError('lost connection'));
  }
}
