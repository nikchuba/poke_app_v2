// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CharacterResponseDto _$CharacterResponseDtoFromJson(Map<String, dynamic> json) {
  return _CharacterResponseDto.fromJson(json);
}

/// @nodoc
mixin _$CharacterResponseDto {
  ResponseInfoDto get info => throw _privateConstructorUsedError;
  List<CharacterDto> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterResponseDtoCopyWith<CharacterResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterResponseDtoCopyWith<$Res> {
  factory $CharacterResponseDtoCopyWith(CharacterResponseDto value,
          $Res Function(CharacterResponseDto) then) =
      _$CharacterResponseDtoCopyWithImpl<$Res, CharacterResponseDto>;
  @useResult
  $Res call({ResponseInfoDto info, List<CharacterDto> results});

  $ResponseInfoDtoCopyWith<$Res> get info;
}

/// @nodoc
class _$CharacterResponseDtoCopyWithImpl<$Res,
        $Val extends CharacterResponseDto>
    implements $CharacterResponseDtoCopyWith<$Res> {
  _$CharacterResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as ResponseInfoDto,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<CharacterDto>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResponseInfoDtoCopyWith<$Res> get info {
    return $ResponseInfoDtoCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CharacterResponseDtoCopyWith<$Res>
    implements $CharacterResponseDtoCopyWith<$Res> {
  factory _$$_CharacterResponseDtoCopyWith(_$_CharacterResponseDto value,
          $Res Function(_$_CharacterResponseDto) then) =
      __$$_CharacterResponseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ResponseInfoDto info, List<CharacterDto> results});

  @override
  $ResponseInfoDtoCopyWith<$Res> get info;
}

/// @nodoc
class __$$_CharacterResponseDtoCopyWithImpl<$Res>
    extends _$CharacterResponseDtoCopyWithImpl<$Res, _$_CharacterResponseDto>
    implements _$$_CharacterResponseDtoCopyWith<$Res> {
  __$$_CharacterResponseDtoCopyWithImpl(_$_CharacterResponseDto _value,
      $Res Function(_$_CharacterResponseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? results = null,
  }) {
    return _then(_$_CharacterResponseDto(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as ResponseInfoDto,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<CharacterDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CharacterResponseDto implements _CharacterResponseDto {
  const _$_CharacterResponseDto(
      {required this.info, required final List<CharacterDto> results})
      : _results = results;

  factory _$_CharacterResponseDto.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterResponseDtoFromJson(json);

  @override
  final ResponseInfoDto info;
  final List<CharacterDto> _results;
  @override
  List<CharacterDto> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'CharacterResponseDto(info: $info, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharacterResponseDto &&
            (identical(other.info, info) || other.info == info) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, info, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CharacterResponseDtoCopyWith<_$_CharacterResponseDto> get copyWith =>
      __$$_CharacterResponseDtoCopyWithImpl<_$_CharacterResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CharacterResponseDtoToJson(
      this,
    );
  }
}

abstract class _CharacterResponseDto implements CharacterResponseDto {
  const factory _CharacterResponseDto(
      {required final ResponseInfoDto info,
      required final List<CharacterDto> results}) = _$_CharacterResponseDto;

  factory _CharacterResponseDto.fromJson(Map<String, dynamic> json) =
      _$_CharacterResponseDto.fromJson;

  @override
  ResponseInfoDto get info;
  @override
  List<CharacterDto> get results;
  @override
  @JsonKey(ignore: true)
  _$$_CharacterResponseDtoCopyWith<_$_CharacterResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}
