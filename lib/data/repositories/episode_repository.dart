import 'package:dio/dio.dart' as dio;
import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/core/error/error.dart';
import 'package:rick_and_morty/core/repository_helper.dart';
import 'package:rick_and_morty/core/typedef/either.dart';
import 'package:rick_and_morty/data/data_sources/remote/rest_api/character_service.dart';
import 'package:rick_and_morty/data/data_sources/remote/rest_api/episode_service.dart';
import 'package:rick_and_morty/data/mappers/character_mapper.dart';
import 'package:rick_and_morty/data/mappers/episode_mapper.dart';
import 'package:rick_and_morty/domain/entities/pagination.dart';
import 'package:rick_and_morty/domain/entities/episode.dart';
import 'package:rick_and_morty/domain/repositories/episode_repository.dart';
import 'package:universal_internet_checker/universal_internet_checker.dart';

class EpisodeRepository with RepositoryHelper implements IEpisodeRepository {
  const EpisodeRepository({
    required EpisodeService episodeService,
    required CharacterService characterService,
  })  : _episodeService = episodeService,
        _characterService = characterService;

  final EpisodeService _episodeService;
  final CharacterService _characterService;

  @override
  Future<ErrorOr<Pagination<Episode>>> getEpisodesBySeason(int season) {
    return _requestWrapper<Pagination<Episode>>(() async {
      final dto = await _episodeService.getEpisodesBySeason('S0$season');
      final ids = <int>{};
      for (var episode in dto.results) {
        ids.addAll(mapCharacterIds(episode.characters));
      }
      final characterCardsDto =
          await _characterService.getCharactersByIds(ids.toList());
      // final r = compute(mapEpisodeResponse);
      return mapEpisodeResponse(
        dto,
        characterCardsDto,
      );
    });
  }

  Future<ErrorOr<T>> _requestWrapper<T>(Future<T> Function() request) async {
    if (await UniversalInternetChecker.checkInternet() ==
        ConnectionStatus.online) {
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
