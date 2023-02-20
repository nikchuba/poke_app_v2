import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/data/repositories/character_repository.dart';
import 'package:rick_and_morty/data/repositories/episode_repository.dart';
import 'package:rick_and_morty/data/repositories/location_repository.dart';
import 'package:rick_and_morty/domain/repositories/character_repository.dart';
import 'package:rick_and_morty/domain/repositories/episode_repository.dart';
import 'package:rick_and_morty/domain/repositories/location_repository.dart';

void init(GetIt locator) {
  locator
    ..registerSingleton<ICharacterRepository>(
      CharacterRepository(service: locator.get()),
    )
    ..registerSingleton<IEpisodeRepository>(
      EpisodeRepository(service: locator.get()),
    )
    ..registerSingleton<ILocationRepository>(
      LocationRepository(service: locator.get()),
    );
}
