import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_location_dto.freezed.dart';
part 'character_location_dto.g.dart';

@freezed
abstract class CharacterLocationDto with _$CharacterLocationDto {
  const factory CharacterLocationDto({
    required String name,
    required String url,
  }) = _CharacterLocationDto;

  factory CharacterLocationDto.fromJson(Map<String, Object?> json) =>
      _$CharacterLocationDtoFromJson(json);
}
