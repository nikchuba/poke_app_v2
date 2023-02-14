// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CharacterDto _$CharacterDtoFromJson(Map<String, dynamic> json) {
  return _CharacterDto.fromJson(json);
}

/// @nodoc
mixin _$CharacterDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  StatusDto get status => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get species => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  GenderDto get gender => throw _privateConstructorUsedError;
  OriginDto get origin => throw _privateConstructorUsedError;
  CharacterLocationDto get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'episode')
  List<String> get episodes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterDtoCopyWith<CharacterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterDtoCopyWith<$Res> {
  factory $CharacterDtoCopyWith(
          CharacterDto value, $Res Function(CharacterDto) then) =
      _$CharacterDtoCopyWithImpl<$Res, CharacterDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      StatusDto status,
      String image,
      String species,
      String type,
      GenderDto gender,
      OriginDto origin,
      CharacterLocationDto location,
      @JsonKey(name: 'episode') List<String> episodes});

  $OriginDtoCopyWith<$Res> get origin;
  $CharacterLocationDtoCopyWith<$Res> get location;
}

/// @nodoc
class _$CharacterDtoCopyWithImpl<$Res, $Val extends CharacterDto>
    implements $CharacterDtoCopyWith<$Res> {
  _$CharacterDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? image = null,
    Object? species = null,
    Object? type = null,
    Object? gender = null,
    Object? origin = null,
    Object? location = null,
    Object? episodes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusDto,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as GenderDto,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as OriginDto,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as CharacterLocationDto,
      episodes: null == episodes
          ? _value.episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OriginDtoCopyWith<$Res> get origin {
    return $OriginDtoCopyWith<$Res>(_value.origin, (value) {
      return _then(_value.copyWith(origin: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CharacterLocationDtoCopyWith<$Res> get location {
    return $CharacterLocationDtoCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CharacterDtoCopyWith<$Res>
    implements $CharacterDtoCopyWith<$Res> {
  factory _$$_CharacterDtoCopyWith(
          _$_CharacterDto value, $Res Function(_$_CharacterDto) then) =
      __$$_CharacterDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      StatusDto status,
      String image,
      String species,
      String type,
      GenderDto gender,
      OriginDto origin,
      CharacterLocationDto location,
      @JsonKey(name: 'episode') List<String> episodes});

  @override
  $OriginDtoCopyWith<$Res> get origin;
  @override
  $CharacterLocationDtoCopyWith<$Res> get location;
}

/// @nodoc
class __$$_CharacterDtoCopyWithImpl<$Res>
    extends _$CharacterDtoCopyWithImpl<$Res, _$_CharacterDto>
    implements _$$_CharacterDtoCopyWith<$Res> {
  __$$_CharacterDtoCopyWithImpl(
      _$_CharacterDto _value, $Res Function(_$_CharacterDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? image = null,
    Object? species = null,
    Object? type = null,
    Object? gender = null,
    Object? origin = null,
    Object? location = null,
    Object? episodes = null,
  }) {
    return _then(_$_CharacterDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusDto,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as GenderDto,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as OriginDto,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as CharacterLocationDto,
      episodes: null == episodes
          ? _value._episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CharacterDto implements _CharacterDto {
  const _$_CharacterDto(
      {required this.id,
      required this.name,
      required this.status,
      required this.image,
      required this.species,
      required this.type,
      required this.gender,
      required this.origin,
      required this.location,
      @JsonKey(name: 'episode') required final List<String> episodes})
      : _episodes = episodes;

  factory _$_CharacterDto.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterDtoFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final StatusDto status;
  @override
  final String image;
  @override
  final String species;
  @override
  final String type;
  @override
  final GenderDto gender;
  @override
  final OriginDto origin;
  @override
  final CharacterLocationDto location;
  final List<String> _episodes;
  @override
  @JsonKey(name: 'episode')
  List<String> get episodes {
    if (_episodes is EqualUnmodifiableListView) return _episodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_episodes);
  }

  @override
  String toString() {
    return 'CharacterDto(id: $id, name: $name, status: $status, image: $image, species: $species, type: $type, gender: $gender, origin: $origin, location: $location, episodes: $episodes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharacterDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other._episodes, _episodes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      status,
      image,
      species,
      type,
      gender,
      origin,
      location,
      const DeepCollectionEquality().hash(_episodes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CharacterDtoCopyWith<_$_CharacterDto> get copyWith =>
      __$$_CharacterDtoCopyWithImpl<_$_CharacterDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CharacterDtoToJson(
      this,
    );
  }
}

abstract class _CharacterDto implements CharacterDto {
  const factory _CharacterDto(
          {required final int id,
          required final String name,
          required final StatusDto status,
          required final String image,
          required final String species,
          required final String type,
          required final GenderDto gender,
          required final OriginDto origin,
          required final CharacterLocationDto location,
          @JsonKey(name: 'episode') required final List<String> episodes}) =
      _$_CharacterDto;

  factory _CharacterDto.fromJson(Map<String, dynamic> json) =
      _$_CharacterDto.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  StatusDto get status;
  @override
  String get image;
  @override
  String get species;
  @override
  String get type;
  @override
  GenderDto get gender;
  @override
  OriginDto get origin;
  @override
  CharacterLocationDto get location;
  @override
  @JsonKey(name: 'episode')
  List<String> get episodes;
  @override
  @JsonKey(ignore: true)
  _$$_CharacterDtoCopyWith<_$_CharacterDto> get copyWith =>
      throw _privateConstructorUsedError;
}
