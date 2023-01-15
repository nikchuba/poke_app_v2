import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'response_info_dto.dart';

part 'response_dto.freezed.dart';
part 'response_dto.g.dart';

@Freezed(genericArgumentFactories: true)
class ResponseDto<T> with _$ResponseDto<T> {
  const factory ResponseDto({
    required ResponseInfoDto info,
    required List<T> results,
  }) = _ResponseDto<T>;

  factory ResponseDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$ResponseDtoFromJson(json, fromJsonT);
}

FutureOr<ResponseDto<T>> deserializeResponseDto<T>(
        Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
    ResponseDto.fromJson(json, fromJsonT);
