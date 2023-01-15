import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rick_and_morty/data/api_url.dart';
import 'package:rick_and_morty/data/models/episode_dto.dart';
import 'package:rick_and_morty/data/models/response_dto.dart';

part 'episode_service.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class EpisodeService {
  factory EpisodeService(Dio dio, {String baseUrl}) = _EpisodeService;

  @GET(ApiUrl.episode)
  Future<ResponseDto<EpisodeDto>> getEpisodes(@Query('page') int page);

  @GET('${ApiUrl.episode}/{id}')
  Future<EpisodeDto> getEpisodeById(@Path() int id);

  @GET(ApiUrl.episode)
  Future<ResponseDto<EpisodeDto>> getEpisodeByName(@Query('name') String name);
}
