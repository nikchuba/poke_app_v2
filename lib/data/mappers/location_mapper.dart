import 'package:rick_and_morty/data/mappers/character_mapper.dart';
import 'package:rick_and_morty/data/models/character_card_dto.dart';
import 'package:rick_and_morty/data/models/character_location_dto.dart';
import 'package:rick_and_morty/data/models/location_dto.dart';
import 'package:rick_and_morty/data/models/origin_dto.dart';
import 'package:rick_and_morty/domain/entities/character_location.dart';
import 'package:rick_and_morty/domain/entities/location.dart';
import 'package:rick_and_morty/domain/entities/origin.dart';

Location mapLocation(
  LocationDto locationDto,
  List<CharacterCardDto> characterCardDto,
) {
  return Location(
    id: locationDto.id,
    name: locationDto.name,
    url: locationDto.url,
    type: locationDto.type,
    dimension: locationDto.dimension,
    residents: characterCardDto.map((dto) => mapCharacterCard(dto)).toList(),
  );
}

CharacterLocation mapCharacterLocation(CharacterLocationDto dto) {
  return CharacterLocation(
    name: dto.name,
    url: dto.url,
  );
}

Origin mapOrigin(OriginDto dto) {
  return Origin(
    name: dto.name,
    url: dto.url,
  );
}
