import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/data/models/character_card_dto.dart';
import 'package:rick_and_morty/data/models/response_info_dto.dart';

part 'character_response_dto.freezed.dart';
part 'character_response_dto.g.dart';

@freezed
class CharacterResponseDto with _$CharacterResponseDto {
  const factory CharacterResponseDto({
    required ResponseInfoDto info,
    required List<CharacterCardDto> results,
  }) = _CharacterResponseDto;

  factory CharacterResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CharacterResponseDtoFromJson(json);
}

FutureOr<CharacterResponseDto> deserializeCharacterResponseDto(
        Map<String, dynamic> json) =>
    CharacterResponseDto.fromJson(json);
