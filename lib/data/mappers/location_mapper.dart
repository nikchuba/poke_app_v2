import 'package:rick_and_morty/data/models/character_location_dto.dart';
import 'package:rick_and_morty/data/models/location_dto.dart';
import 'package:rick_and_morty/data/models/location_response_dto.dart';
import 'package:rick_and_morty/data/models/origin_dto.dart';
import 'package:rick_and_morty/domain/entities/character_location.dart';
import 'package:rick_and_morty/domain/entities/location.dart';
import 'package:rick_and_morty/domain/entities/origin.dart';
import 'package:rick_and_morty/domain/entities/pagination.dart';

import 'response_info_mapper.dart';

Location mapLocation(
  LocationDto locationDto,
) {
  return Location(
    id: locationDto.id,
    name: locationDto.name,
    url: locationDto.url,
    type: locationDto.type,
    dimension: locationDto.dimension,
    residents: locationDto.residents,
  );
}

Pagination<Location> mapLocationResponse(LocationResponseDto dto) {
  return Pagination(
    info: mapResponseInfo(dto.info),
    results: dto.results.map(mapLocation).toList(),
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
