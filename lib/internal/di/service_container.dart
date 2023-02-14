import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/data/data_sources/remote/rest_api/character_service.dart';
import 'package:rick_and_morty/data/data_sources/remote/rest_api/episode_service.dart';
import 'package:rick_and_morty/data/data_sources/remote/rest_api/location_service.dart';

void init(GetIt locator) {
  final dio = locator.get<Dio>();

  locator
    ..registerSingleton<CharacterService>(CharacterService(dio))
    ..registerSingleton<EpisodeService>(EpisodeService(dio))
    ..registerSingleton<LocationService>(LocationService(dio));
}
