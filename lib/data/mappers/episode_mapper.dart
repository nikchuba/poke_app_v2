import 'package:rick_and_morty/data/models/character_card_dto.dart';
import 'package:rick_and_morty/data/models/episode_dto.dart';
import 'package:rick_and_morty/data/models/episode_response_dto.dart';
import 'package:rick_and_morty/domain/entities/episode.dart';
import 'package:rick_and_morty/domain/entities/pagination.dart';

import 'character_mapper.dart';
import 'response_info_mapper.dart';

Episode mapEpisode(
  EpisodeDto episodeDto,
  List<CharacterCardDto> characterCardDto,
  List<int> ids,
) {
  return Episode(
    id: episodeDto.id,
    name: episodeDto.name,
    airDate: episodeDto.airDate,
    code: episodeDto.episode,
    characters: ids
        .map(
          (id) => mapCharacterCard(
            characterCardDto.firstWhere((character) => character.id == id),
          ),
        )
        .toList(),
  );
}

Pagination<Episode> mapEpisodeResponse(
  EpisodeResponseDto dto,
  List<CharacterCardDto> characterCardDto,
) {
  return Pagination(
    info: mapResponseInfo(dto.info),
    results: dto.results.map((dto) {
      return mapEpisode(
        dto,
        characterCardDto,
        mapCharacterIds(dto.characters),
      );
    }).toList(),
  );
}
