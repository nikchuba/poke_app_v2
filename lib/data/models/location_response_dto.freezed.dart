// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocationResponseDto _$LocationResponseDtoFromJson(Map<String, dynamic> json) {
  return _LocationResponseDto.fromJson(json);
}

/// @nodoc
mixin _$LocationResponseDto {
  ResponseInfoDto get info => throw _privateConstructorUsedError;
  List<LocationDto> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationResponseDtoCopyWith<LocationResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationResponseDtoCopyWith<$Res> {
  factory $LocationResponseDtoCopyWith(
          LocationResponseDto value, $Res Function(LocationResponseDto) then) =
      _$LocationResponseDtoCopyWithImpl<$Res, LocationResponseDto>;
  @useResult
  $Res call({ResponseInfoDto info, List<LocationDto> results});

  $ResponseInfoDtoCopyWith<$Res> get info;
}

/// @nodoc
class _$LocationResponseDtoCopyWithImpl<$Res, $Val extends LocationResponseDto>
    implements $LocationResponseDtoCopyWith<$Res> {
  _$LocationResponseDtoCopyWithImpl(this._value, this._then);

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
              as List<LocationDto>,
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
abstract class _$$_LocationResponseDtoCopyWith<$Res>
    implements $LocationResponseDtoCopyWith<$Res> {
  factory _$$_LocationResponseDtoCopyWith(_$_LocationResponseDto value,
          $Res Function(_$_LocationResponseDto) then) =
      __$$_LocationResponseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ResponseInfoDto info, List<LocationDto> results});

  @override
  $ResponseInfoDtoCopyWith<$Res> get info;
}

/// @nodoc
class __$$_LocationResponseDtoCopyWithImpl<$Res>
    extends _$LocationResponseDtoCopyWithImpl<$Res, _$_LocationResponseDto>
    implements _$$_LocationResponseDtoCopyWith<$Res> {
  __$$_LocationResponseDtoCopyWithImpl(_$_LocationResponseDto _value,
      $Res Function(_$_LocationResponseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? results = null,
  }) {
    return _then(_$_LocationResponseDto(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as ResponseInfoDto,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<LocationDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocationResponseDto implements _LocationResponseDto {
  const _$_LocationResponseDto(
      {required this.info, required final List<LocationDto> results})
      : _results = results;

  factory _$_LocationResponseDto.fromJson(Map<String, dynamic> json) =>
      _$$_LocationResponseDtoFromJson(json);

  @override
  final ResponseInfoDto info;
  final List<LocationDto> _results;
  @override
  List<LocationDto> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'LocationResponseDto(info: $info, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocationResponseDto &&
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
  _$$_LocationResponseDtoCopyWith<_$_LocationResponseDto> get copyWith =>
      __$$_LocationResponseDtoCopyWithImpl<_$_LocationResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationResponseDtoToJson(
      this,
    );
  }
}

abstract class _LocationResponseDto implements LocationResponseDto {
  const factory _LocationResponseDto(
      {required final ResponseInfoDto info,
      required final List<LocationDto> results}) = _$_LocationResponseDto;

  factory _LocationResponseDto.fromJson(Map<String, dynamic> json) =
      _$_LocationResponseDto.fromJson;

  @override
  ResponseInfoDto get info;
  @override
  List<LocationDto> get results;
  @override
  @JsonKey(ignore: true)
  _$$_LocationResponseDtoCopyWith<_$_LocationResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}
