import 'package:rick_and_morty/core/typedef/error_or.dart';

import '../entities/episode.dart';
import '../entities/pagination.dart';

abstract class IEpisodeRepository {
  Future<ErrorOr<Pagination<Episode>>> getEpisodesBySeason(int season);
}
