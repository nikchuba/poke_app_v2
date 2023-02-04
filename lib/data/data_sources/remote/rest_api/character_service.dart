import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rick_and_morty/data/api_url.dart';
import 'package:rick_and_morty/data/models/character_card_dto.dart';
import 'package:rick_and_morty/data/models/character_dto.dart';
import 'package:rick_and_morty/data/models/character_filter_dto.dart';
import 'package:rick_and_morty/data/models/character_response_dto.dart';

part 'character_service.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class CharacterService {
  factory CharacterService(Dio dio, {String baseUrl}) = _CharacterService;

  @GET(ApiUrl.character)
  Future<CharacterResponseDto> getCharacters(@Query('page') int? page);

  @GET('${ApiUrl.character}/{id}')
  Future<CharacterDto> getCharacterById(@Path() int id);

  @GET('${ApiUrl.character}/{ids}')
  Future<List<CharacterCardDto>> getCharactersByIds(@Path() List<int> ids);

  @GET(ApiUrl.character)
  Future<CharacterResponseDto> getCharactersByFilter(
    @Queries(encoded: true) CharacterFilterDto request,
  );

  @GET(ApiUrl.character)
  Future<CharacterResponseDto> getCharacterByName(
    @Query('name') String name,
  );
}
