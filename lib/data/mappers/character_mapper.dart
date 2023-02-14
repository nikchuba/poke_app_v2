import 'package:rick_and_morty/data/models/character_card_dto.dart';
import 'package:rick_and_morty/data/models/character_dto.dart';
import 'package:rick_and_morty/data/models/character_response_dto.dart';
import 'package:rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/domain/entities/character_card.dart';
import 'package:rick_and_morty/domain/entities/pagination.dart';

import 'enum_mapper.dart';
import 'location_mapper.dart';
import 'response_info_mapper.dart';

Character mapCharacter(CharacterDto dto) {
  return Character(
    id: dto.id,
    name: dto.name,
    status: mapStatus(dto.status),
    image: dto.image,
    species: dto.species,
    type: dto.type,
    gender: mapGender(dto.gender),
    origin: mapOrigin(dto.origin),
    location: mapCharacterLocation(dto.location),
    episodes: dto.episodes,
  );
}

Pagination<CharacterCard> mapCharacterPagination(CharacterResponseDto dto) {
  return Pagination(
    info: mapResponseInfo(dto.info),
    results: dto.results.map(mapCharacterCard).toList(),
  );
}

CharacterCard mapCharacterCard(CharacterCardDto dto) {
  return CharacterCard(
    id: dto.id,
    name: dto.name,
    status: mapStatus(dto.status),
    image: dto.image,
  );
}

List<CharacterCard> mapCharacterCards(List<CharacterCardDto> dto) {
  return dto
      .map((e) => CharacterCard(
            id: e.id,
            name: e.name,
            status: mapStatus(e.status),
            image: e.image,
          ))
      .toList();
}

List<int> mapCharacterIds(List<Uri> characters) {
  return characters
      .map((character) => int.parse(character.pathSegments.last))
      .toList();
}
