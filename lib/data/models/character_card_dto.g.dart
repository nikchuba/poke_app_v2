// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CharacterCardDto _$$_CharacterCardDtoFromJson(Map<String, dynamic> json) =>
    _$_CharacterCardDto(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$_CharacterCardDtoToJson(_$_CharacterCardDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'image': instance.image,
    };
