import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_card_dto.freezed.dart';
part 'character_card_dto.g.dart';

@freezed
abstract class CharacterCardDto with _$CharacterCardDto {
  const factory CharacterCardDto({
    required int id,
    required String name,
    required String status,
    required String image,
  }) = _CharacterCardDto;

  factory CharacterCardDto.fromJson(Map<String, Object?> json) =>
      _$CharacterCardDtoFromJson(json);
}
