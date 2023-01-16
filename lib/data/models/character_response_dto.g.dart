// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CharacterResponseDto _$$_CharacterResponseDtoFromJson(
        Map<String, dynamic> json) =>
    _$_CharacterResponseDto(
      info: ResponseInfoDto.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => CharacterCardDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CharacterResponseDtoToJson(
        _$_CharacterResponseDto instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
