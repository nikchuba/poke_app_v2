import 'package:rick_and_morty/data/data_sources/remote/rest_api/episode_service.dart';
import 'package:rick_and_morty/domain/repositories/episode_repository.dart';

class EpisodeRepository implements IEpisodeRepository {
  const EpisodeRepository({required this.service});

  final EpisodeService service;
}
