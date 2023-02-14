import 'package:rick_and_morty/core/repository_helper.dart';
import 'package:rick_and_morty/core/typedef/either.dart';
import 'package:rick_and_morty/data/data_sources/remote/rest_api/episode_service.dart';
import 'package:rick_and_morty/data/mappers/episode_mapper.dart';
import 'package:rick_and_morty/domain/entities/pagination.dart';
import 'package:rick_and_morty/domain/entities/episode.dart';
import 'package:rick_and_morty/domain/repositories/episode_repository.dart';

class EpisodeRepository with RepositoryHelper implements IEpisodeRepository {
  const EpisodeRepository({
    required EpisodeService service,
  }) : _service = service;

  final EpisodeService _service;

  @override
  Future<ErrorOr<Pagination<Episode>>> getEpisodesBySeason(int season) {
    return requestParser(
      request: () => _service.getEpisodesBySeason('S0$season'),
      parser: mapEpisodeResponse,
    );
  }
}
