// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocationResponseDto _$$_LocationResponseDtoFromJson(
        Map<String, dynamic> json) =>
    _$_LocationResponseDto(
      info: ResponseInfoDto.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => LocationDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LocationResponseDtoToJson(
        _$_LocationResponseDto instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
