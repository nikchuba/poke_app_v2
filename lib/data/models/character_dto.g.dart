// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CharacterDto _$$_CharacterDtoFromJson(Map<String, dynamic> json) =>
    _$_CharacterDto(
      id: json['id'] as int,
      name: json['name'] as String,
      status: $enumDecode(_$StatusDtoEnumMap, json['status']),
      image: json['image'] as String,
      species: json['species'] as String,
      type: json['type'] as String,
      gender: $enumDecode(_$GenderDtoEnumMap, json['gender']),
      origin: OriginDto.fromJson(json['origin'] as Map<String, dynamic>),
      location: CharacterLocationDto.fromJson(
          json['location'] as Map<String, dynamic>),
      episodes:
          (json['episodes'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_CharacterDtoToJson(_$_CharacterDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': _$StatusDtoEnumMap[instance.status]!,
      'image': instance.image,
      'species': instance.species,
      'type': instance.type,
      'gender': _$GenderDtoEnumMap[instance.gender]!,
      'origin': instance.origin,
      'location': instance.location,
      'episodes': instance.episodes,
    };

const _$StatusDtoEnumMap = {
  StatusDto.alive: 'Alive',
  StatusDto.dead: 'Dead',
  StatusDto.unknown: 'unknown',
};

const _$GenderDtoEnumMap = {
  GenderDto.female: 'Female',
  GenderDto.male: 'Male',
  GenderDto.genderless: 'Genderless',
  GenderDto.unknown: 'unknown',
};
