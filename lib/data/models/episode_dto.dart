import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode_dto.freezed.dart';
part 'episode_dto.g.dart';

@freezed
abstract class EpisodeDto with _$EpisodeDto {
  const factory EpisodeDto({
    required int id,
    required String name,
    @JsonKey(name: 'air_date') required String airDate,
    required String episode,
    required List<String> characters,
  }) = _EpisodeDto;

  factory EpisodeDto.fromJson(Map<String, Object?> json) =>
      _$EpisodeDtoFromJson(json);
}

FutureOr<EpisodeDto> deserializeEpisodeDto(Map<String, dynamic> json) =>
    EpisodeDto.fromJson(json);
