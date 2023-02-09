import 'package:rick_and_morty/core/typedef/either.dart';

import '../entities/episode.dart';
import '../entities/pagination.dart';

abstract class IEpisodeRepository {
  Future<ErrorOr<Pagination<Episode>>> getEpisodesBySeason(int season);
}
