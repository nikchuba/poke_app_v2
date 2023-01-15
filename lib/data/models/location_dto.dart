import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_dto.freezed.dart';
part 'location_dto.g.dart';

@freezed
abstract class LocationDto with _$LocationDto {
  const factory LocationDto({
    required int id,
    required String name,
    required String type,
    required String dimension,
    required List<String> residents,
    required String url,
  }) = _LocationDto;

  factory LocationDto.fromJson(Map<String, Object?> json) =>
      _$LocationDtoFromJson(json);
}

FutureOr<LocationDto> deserializeLocationDto(Map<String, dynamic> json) =>
    LocationDto.fromJson(json);
