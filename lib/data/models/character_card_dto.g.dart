// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CharacterCardDto _$$_CharacterCardDtoFromJson(Map<String, dynamic> json) =>
    _$_CharacterCardDto(
      id: json['id'] as int,
      name: json['name'] as String,
      status: $enumDecode(_$StatusDtoEnumMap, json['status']),
      image: json['image'] as String,
    );

Map<String, dynamic> _$$_CharacterCardDtoToJson(_$_CharacterCardDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': _$StatusDtoEnumMap[instance.status]!,
      'image': instance.image,
    };

const _$StatusDtoEnumMap = {
  StatusDto.alive: 'Alive',
  StatusDto.dead: 'Dead',
  StatusDto.unknown: 'unknown',
};
