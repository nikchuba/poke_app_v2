import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rick_and_morty/data/api_url.dart';
import 'package:rick_and_morty/data/models/character_card_dto.dart';
import 'package:rick_and_morty/data/models/character_dto.dart';
import 'package:rick_and_morty/data/models/response_dto.dart';

part 'character_service.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class CharacterService {
  factory CharacterService(Dio dio, {String baseUrl}) = _CharacterService;

  @GET(ApiUrl.character)
  Future<ResponseDto<CharacterCardDto>> getCharacters(@Query('page') int page);

  @GET('${ApiUrl.character}/{id}')
  Future<CharacterDto> getCharacterById(@Path() int id);

  @GET(ApiUrl.character)
  Future<ResponseDto<CharacterCardDto>> getCharacterByName(
    @Query('name') String name,
  );
}
