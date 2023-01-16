// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EpisodeResponseDto _$$_EpisodeResponseDtoFromJson(
        Map<String, dynamic> json) =>
    _$_EpisodeResponseDto(
      info: ResponseInfoDto.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => EpisodeDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_EpisodeResponseDtoToJson(
        _$_EpisodeResponseDto instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
