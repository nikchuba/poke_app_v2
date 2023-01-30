import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:rick_and_morty/core/error/error.dart';
import 'package:rick_and_morty/core/error/exception.dart';
import 'package:rick_and_morty/core/typedef/error_or.dart';
import 'package:rick_and_morty/data/data_sources/remote/rest_api/character_service.dart';
import 'package:rick_and_morty/data/mappers/character_mapper.dart';
import 'package:rick_and_morty/data/mappers/enum_mapper.dart';
import 'package:rick_and_morty/data/models/character_filter_dto.dart';
import 'package:rick_and_morty/domain/entities/response.dart';

import 'package:rick_and_morty/domain/entities/character_card.dart';

import 'package:rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/domain/entities/search_filter.dart';

import '../../domain/repositories/character_repository.dart';

class CharacterRepository implements ICharacterRepository {
  const CharacterRepository({
    required CharacterService service,
  }) : _service = service;

  final CharacterService _service;

  @override
  Future<ErrorOr<Character>> getCharacterById(int id) async {
    try {
      final dto = await _service.getCharacterById(id);
      final entity = await compute(mapCharacter, dto);
      return Right(entity);
    } on IException catch (e) {
      return Left(ServerError(e.message));
    }
  }

  @override
  Future<ErrorOr<Response<CharacterCard>>> getCharacters({
    int? page,
  }) async {
    try {
      final dto = await _service.getCharacters(page);
      final entity = await compute(mapCharacterResponse, dto);
      return Right(entity);
    } on dio.DioError catch (e) {
      return Left(ServerError(e.message));
    }
  }

  @override
  Future<ErrorOr<Response<CharacterCard>>> getCharactersByFilter(
    SearchFilter<CharacterFilter> filter,
  ) async {
    try {
      final dto = await _service.getCharactersByFilter(
        CharacterFilterDto(
          name: filter.filter.name,
          species: filter.filter.species,
          type: filter.filter.type,
          status: mapStatusDto(filter.filter.status),
          gender: mapGenderDto(filter.filter.gender),
        ),
      );
      final entity = await compute(mapCharacterResponse, dto);
      return Right(entity);
    } on dio.DioError catch (e) {
      return Left(ServerError(e.message));
    }
  }

  @override
  Future<ErrorOr<Response<CharacterCard>>> getCharactersByName(
    String name,
  ) async {
    try {
      final dto = await _service.getCharacterByName(name);
      final entity = await compute(mapCharacterResponse, dto);
      return Right(entity);
    } on dio.DioError catch (e) {
      return Left(ServerError(e.message));
    }
  }
}
