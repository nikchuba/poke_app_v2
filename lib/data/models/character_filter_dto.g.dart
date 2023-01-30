// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CharacterFilterDto _$$_CharacterFilterDtoFromJson(
        Map<String, dynamic> json) =>
    _$_CharacterFilterDto(
      name: json['name'] as String?,
      status: $enumDecodeNullable(_$StatusDtoEnumMap, json['status']),
      species: json['species'] as String?,
      type: json['type'] as String?,
      gender: $enumDecodeNullable(_$GenderDtoEnumMap, json['gender']),
    );

Map<String, dynamic> _$$_CharacterFilterDtoToJson(
        _$_CharacterFilterDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'status': _$StatusDtoEnumMap[instance.status],
      'species': instance.species,
      'type': instance.type,
      'gender': _$GenderDtoEnumMap[instance.gender],
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
