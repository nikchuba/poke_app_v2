import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rick_and_morty/data/api_url.dart';
import 'package:rick_and_morty/data/models/location_dto.dart';
import 'package:rick_and_morty/data/models/response_dto.dart';

part 'location_service.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class LocationService {
  factory LocationService(Dio dio, {String baseUrl}) = _LocationService;

  @GET(ApiUrl.location)
  Future<ResponseDto<LocationDto>> getLocations(@Query('page') int page);

  @GET('${ApiUrl.location}/{id}')
  Future<LocationDto> getLocationById(@Path() int id);

  @GET(ApiUrl.location)
  Future<ResponseDto<LocationDto>> getLocationByName(
      @Query('name') String name);
}
