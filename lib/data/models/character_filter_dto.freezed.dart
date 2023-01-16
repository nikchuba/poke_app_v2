// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_filter_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CharacterFilterDto _$CharacterFilterDtoFromJson(Map<String, dynamic> json) {
  return _CharacterFilterDto.fromJson(json);
}

/// @nodoc
mixin _$CharacterFilterDto {
  String? get name => throw _privateConstructorUsedError;
  StatusDto? get status => throw _privateConstructorUsedError;
  String? get species => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  GenderDto? get gender => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterFilterDtoCopyWith<CharacterFilterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterFilterDtoCopyWith<$Res> {
  factory $CharacterFilterDtoCopyWith(
          CharacterFilterDto value, $Res Function(CharacterFilterDto) then) =
      _$CharacterFilterDtoCopyWithImpl<$Res, CharacterFilterDto>;
  @useResult
  $Res call(
      {String? name,
      StatusDto? status,
      String? species,
      String? type,
      GenderDto? gender});
}

/// @nodoc
class _$CharacterFilterDtoCopyWithImpl<$Res, $Val extends CharacterFilterDto>
    implements $CharacterFilterDtoCopyWith<$Res> {
  _$CharacterFilterDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? status = freezed,
    Object? species = freezed,
    Object? type = freezed,
    Object? gender = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusDto?,
      species: freezed == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as GenderDto?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CharacterFilterDtoCopyWith<$Res>
    implements $CharacterFilterDtoCopyWith<$Res> {
  factory _$$_CharacterFilterDtoCopyWith(_$_CharacterFilterDto value,
          $Res Function(_$_CharacterFilterDto) then) =
      __$$_CharacterFilterDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      StatusDto? status,
      String? species,
      String? type,
      GenderDto? gender});
}

/// @nodoc
class __$$_CharacterFilterDtoCopyWithImpl<$Res>
    extends _$CharacterFilterDtoCopyWithImpl<$Res, _$_CharacterFilterDto>
    implements _$$_CharacterFilterDtoCopyWith<$Res> {
  __$$_CharacterFilterDtoCopyWithImpl(
      _$_CharacterFilterDto _value, $Res Function(_$_CharacterFilterDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? status = freezed,
    Object? species = freezed,
    Object? type = freezed,
    Object? gender = freezed,
  }) {
    return _then(_$_CharacterFilterDto(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusDto?,
      species: freezed == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as GenderDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CharacterFilterDto implements _CharacterFilterDto {
  const _$_CharacterFilterDto(
      {this.name, this.status, this.species, this.type, this.gender});

  factory _$_CharacterFilterDto.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterFilterDtoFromJson(json);

  @override
  final String? name;
  @override
  final StatusDto? status;
  @override
  final String? species;
  @override
  final String? type;
  @override
  final GenderDto? gender;

  @override
  String toString() {
    return 'CharacterFilterDto(name: $name, status: $status, species: $species, type: $type, gender: $gender)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharacterFilterDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, status, species, type, gender);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CharacterFilterDtoCopyWith<_$_CharacterFilterDto> get copyWith =>
      __$$_CharacterFilterDtoCopyWithImpl<_$_CharacterFilterDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CharacterFilterDtoToJson(
      this,
    );
  }
}

abstract class _CharacterFilterDto implements CharacterFilterDto {
  const factory _CharacterFilterDto(
      {final String? name,
      final StatusDto? status,
      final String? species,
      final String? type,
      final GenderDto? gender}) = _$_CharacterFilterDto;

  factory _CharacterFilterDto.fromJson(Map<String, dynamic> json) =
      _$_CharacterFilterDto.fromJson;

  @override
  String? get name;
  @override
  StatusDto? get status;
  @override
  String? get species;
  @override
  String? get type;
  @override
  GenderDto? get gender;
  @override
  @JsonKey(ignore: true)
  _$$_CharacterFilterDtoCopyWith<_$_CharacterFilterDto> get copyWith =>
      throw _privateConstructorUsedError;
}
