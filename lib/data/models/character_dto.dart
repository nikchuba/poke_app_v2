import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/data/models/character_location_dto.dart';
import 'package:rick_and_morty/data/models/origin_dto.dart';

part 'character_dto.freezed.dart';
part 'character_dto.g.dart';

@freezed
abstract class CharacterDto with _$CharacterDto {
  const factory CharacterDto({
    required int id,
    required String name,
    required String status,
    required String image,
    required String species,
    required String type,
    required String gender,
    required OriginDto origin,
    required CharacterLocationDto location,
    required List<String> episodes,
  }) = _CharacterDto;

  factory CharacterDto.fromJson(Map<String, Object?> json) =>
      _$CharacterDtoFromJson(json);
}

FutureOr<CharacterDto> deserializeCharacterDto(Map<String, dynamic> json) =>
    CharacterDto.fromJson(json);
