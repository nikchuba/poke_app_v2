import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rick_and_morty/data/api_url.dart';
import 'package:rick_and_morty/data/models/location_dto.dart';
import 'package:rick_and_morty/data/models/location_response_dto.dart';

part 'location_service.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class LocationService {
  factory LocationService(Dio dio, {String baseUrl}) = _LocationService;

  @GET(ApiUrl.location)
  Future<LocationResponseDto> getLocations(@Query('page') int page);

  @GET('${ApiUrl.location}/{id}')
  Future<LocationDto> getLocationById(@Path() int id);

  @GET(ApiUrl.location)
  Future<LocationResponseDto> getLocationByName(@Query('name') String name);
}
