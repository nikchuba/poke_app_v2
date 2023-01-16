import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/data/models/episode_dto.dart';
import 'package:rick_and_morty/data/models/response_info_dto.dart';

part 'episode_response_dto.freezed.dart';
part 'episode_response_dto.g.dart';

@freezed
class EpisodeResponseDto with _$EpisodeResponseDto {
  const factory EpisodeResponseDto({
    required ResponseInfoDto info,
    required List<EpisodeDto> results,
  }) = _EpisodeResponseDto;

  factory EpisodeResponseDto.fromJson(Map<String, dynamic> json) =>
      _$EpisodeResponseDtoFromJson(json);
}

FutureOr<EpisodeResponseDto> deserializeEpisodeResponseDto(
        Map<String, dynamic> json) =>
    EpisodeResponseDto.fromJson(json);
