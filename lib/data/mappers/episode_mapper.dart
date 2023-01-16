import 'package:rick_and_morty/data/models/character_card_dto.dart';
import 'package:rick_and_morty/data/models/episode_dto.dart';
import 'package:rick_and_morty/domain/entities/episode.dart';

import 'character_mapper.dart';

Episode mapEpisode(
  EpisodeDto episodeDto,
  List<CharacterCardDto> characterCardDto,
) {
  return Episode(
    id: episodeDto.id,
    name: episodeDto.name,
    airDate: episodeDto.airDate,
    code: episodeDto.episode,
    characters: characterCardDto.map(mapCharacterCard).toList(),
  );
}
