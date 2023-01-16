// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_card_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CharacterCardDto _$CharacterCardDtoFromJson(Map<String, dynamic> json) {
  return _CharacterCardDto.fromJson(json);
}

/// @nodoc
mixin _$CharacterCardDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  StatusDto get status => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterCardDtoCopyWith<CharacterCardDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterCardDtoCopyWith<$Res> {
  factory $CharacterCardDtoCopyWith(
          CharacterCardDto value, $Res Function(CharacterCardDto) then) =
      _$CharacterCardDtoCopyWithImpl<$Res, CharacterCardDto>;
  @useResult
  $Res call({int id, String name, StatusDto status, String image});
}

/// @nodoc
class _$CharacterCardDtoCopyWithImpl<$Res, $Val extends CharacterCardDto>
    implements $CharacterCardDtoCopyWith<$Res> {
  _$CharacterCardDtoCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CharacterCardDtoCopyWith<$Res>
    implements $CharacterCardDtoCopyWith<$Res> {
  factory _$$_CharacterCardDtoCopyWith(
          _$_CharacterCardDto value, $Res Function(_$_CharacterCardDto) then) =
      __$$_CharacterCardDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, StatusDto status, String image});
}

/// @nodoc
class __$$_CharacterCardDtoCopyWithImpl<$Res>
    extends _$CharacterCardDtoCopyWithImpl<$Res, _$_CharacterCardDto>
    implements _$$_CharacterCardDtoCopyWith<$Res> {
  __$$_CharacterCardDtoCopyWithImpl(
      _$_CharacterCardDto _value, $Res Function(_$_CharacterCardDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? image = null,
  }) {
    return _then(_$_CharacterCardDto(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CharacterCardDto implements _CharacterCardDto {
  const _$_CharacterCardDto(
      {required this.id,
      required this.name,
      required this.status,
      required this.image});

  factory _$_CharacterCardDto.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterCardDtoFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final StatusDto status;
  @override
  final String image;

  @override
  String toString() {
    return 'CharacterCardDto(id: $id, name: $name, status: $status, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharacterCardDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, status, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CharacterCardDtoCopyWith<_$_CharacterCardDto> get copyWith =>
      __$$_CharacterCardDtoCopyWithImpl<_$_CharacterCardDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CharacterCardDtoToJson(
      this,
    );
  }
}

abstract class _CharacterCardDto implements CharacterCardDto {
  const factory _CharacterCardDto(
      {required final int id,
      required final String name,
      required final StatusDto status,
      required final String image}) = _$_CharacterCardDto;

  factory _CharacterCardDto.fromJson(Map<String, dynamic> json) =
      _$_CharacterCardDto.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  StatusDto get status;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_CharacterCardDtoCopyWith<_$_CharacterCardDto> get copyWith =>
      throw _privateConstructorUsedError;
}
