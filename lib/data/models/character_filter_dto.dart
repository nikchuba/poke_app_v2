import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/data/models/enums/gender_dto.dart';

import 'enums/status_dto.dart';

part 'character_filter_dto.freezed.dart';
part 'character_filter_dto.g.dart';

@Freezed(toJson: true)
abstract class CharacterFilterDto with _$CharacterFilterDto {
  const factory CharacterFilterDto({
    String? name,
    StatusDto? status,
    String? species,
    String? type,
    GenderDto? gender,
  }) = _CharacterFilterDto;

  factory CharacterFilterDto.fromJson(Map<String, Object?> json) =>
      _$CharacterFilterDtoFromJson(json);
}

Map<String, Object?> serializeCharacterFilterDto(CharacterFilterDto data) =>
    data.toJson();
