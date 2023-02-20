import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/managers/character_manager.dart';
import 'package:rick_and_morty/managers/episode_manager.dart';
import 'package:rick_and_morty/managers/location_manager.dart';

void init(GetIt locator) {
  locator
    ..registerSingleton<CharacterManager>(
      CharacterManager(
        repository: locator.get(),
      )..init(),
    )
    ..registerSingleton(
      EpisodeManager(
        repository: locator.get(),
      )..init(),
    )
    ..registerSingleton(
      LocationManager(
        repository: locator.get(),
      )..init(),
    );
}
