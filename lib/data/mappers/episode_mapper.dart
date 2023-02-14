import 'package:rick_and_morty/data/models/episode_dto.dart';
import 'package:rick_and_morty/data/models/episode_response_dto.dart';
import 'package:rick_and_morty/domain/entities/episode.dart';
import 'package:rick_and_morty/domain/entities/pagination.dart';

import 'response_info_mapper.dart';

Episode mapEpisode(EpisodeDto episodeDto) {
  return Episode(
    id: episodeDto.id,
    name: episodeDto.name,
    airDate: episodeDto.airDate,
    code: episodeDto.episode,
    characters: episodeDto.characters,
  );
}

Pagination<Episode> mapEpisodeResponse(EpisodeResponseDto dto) {
  return Pagination(
    info: mapResponseInfo(dto.info),
    results: dto.results.map((dto) => mapEpisode(dto)).toList(),
  );
}
