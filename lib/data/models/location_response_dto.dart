import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/data/models/location_dto.dart';
import 'package:rick_and_morty/data/models/response_info_dto.dart';

part 'location_response_dto.freezed.dart';
part 'location_response_dto.g.dart';

@freezed
class LocationResponseDto with _$LocationResponseDto {
  const factory LocationResponseDto({
    required ResponseInfoDto info,
    required List<LocationDto> results,
  }) = _LocationResponseDto;

  factory LocationResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseDtoFromJson(json);
}

FutureOr<LocationResponseDto> deserializeLocationResponseDto(
        Map<String, dynamic> json) =>
    LocationResponseDto.fromJson(json);
