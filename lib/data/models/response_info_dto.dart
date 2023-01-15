import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_info_dto.freezed.dart';
part 'response_info_dto.g.dart';

@freezed
abstract class ResponseInfoDto with _$ResponseInfoDto {
  const factory ResponseInfoDto({
    required int count,
    required int pages,
    String? next,
    String? prev,
  }) = _ResponseInfoDto;

  factory ResponseInfoDto.fromJson(Map<String, Object?> json) =>
      _$ResponseInfoDtoFromJson(json);
}
