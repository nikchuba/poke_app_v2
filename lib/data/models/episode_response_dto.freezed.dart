// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EpisodeResponseDto _$EpisodeResponseDtoFromJson(Map<String, dynamic> json) {
  return _EpisodeResponseDto.fromJson(json);
}

/// @nodoc
mixin _$EpisodeResponseDto {
  ResponseInfoDto get info => throw _privateConstructorUsedError;
  List<EpisodeDto> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpisodeResponseDtoCopyWith<EpisodeResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeResponseDtoCopyWith<$Res> {
  factory $EpisodeResponseDtoCopyWith(
          EpisodeResponseDto value, $Res Function(EpisodeResponseDto) then) =
      _$EpisodeResponseDtoCopyWithImpl<$Res, EpisodeResponseDto>;
  @useResult
  $Res call({ResponseInfoDto info, List<EpisodeDto> results});

  $ResponseInfoDtoCopyWith<$Res> get info;
}

/// @nodoc
class _$EpisodeResponseDtoCopyWithImpl<$Res, $Val extends EpisodeResponseDto>
    implements $EpisodeResponseDtoCopyWith<$Res> {
  _$EpisodeResponseDtoCopyWithImpl(this._value, this._then);

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
              as List<EpisodeDto>,
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
abstract class _$$_EpisodeResponseDtoCopyWith<$Res>
    implements $EpisodeResponseDtoCopyWith<$Res> {
  factory _$$_EpisodeResponseDtoCopyWith(_$_EpisodeResponseDto value,
          $Res Function(_$_EpisodeResponseDto) then) =
      __$$_EpisodeResponseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ResponseInfoDto info, List<EpisodeDto> results});

  @override
  $ResponseInfoDtoCopyWith<$Res> get info;
}

/// @nodoc
class __$$_EpisodeResponseDtoCopyWithImpl<$Res>
    extends _$EpisodeResponseDtoCopyWithImpl<$Res, _$_EpisodeResponseDto>
    implements _$$_EpisodeResponseDtoCopyWith<$Res> {
  __$$_EpisodeResponseDtoCopyWithImpl(
      _$_EpisodeResponseDto _value, $Res Function(_$_EpisodeResponseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? results = null,
  }) {
    return _then(_$_EpisodeResponseDto(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as ResponseInfoDto,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<EpisodeDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EpisodeResponseDto implements _EpisodeResponseDto {
  const _$_EpisodeResponseDto(
      {required this.info, required final List<EpisodeDto> results})
      : _results = results;

  factory _$_EpisodeResponseDto.fromJson(Map<String, dynamic> json) =>
      _$$_EpisodeResponseDtoFromJson(json);

  @override
  final ResponseInfoDto info;
  final List<EpisodeDto> _results;
  @override
  List<EpisodeDto> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'EpisodeResponseDto(info: $info, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EpisodeResponseDto &&
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
  _$$_EpisodeResponseDtoCopyWith<_$_EpisodeResponseDto> get copyWith =>
      __$$_EpisodeResponseDtoCopyWithImpl<_$_EpisodeResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EpisodeResponseDtoToJson(
      this,
    );
  }
}

abstract class _EpisodeResponseDto implements EpisodeResponseDto {
  const factory _EpisodeResponseDto(
      {required final ResponseInfoDto info,
      required final List<EpisodeDto> results}) = _$_EpisodeResponseDto;

  factory _EpisodeResponseDto.fromJson(Map<String, dynamic> json) =
      _$_EpisodeResponseDto.fromJson;

  @override
  ResponseInfoDto get info;
  @override
  List<EpisodeDto> get results;
  @override
  @JsonKey(ignore: true)
  _$$_EpisodeResponseDtoCopyWith<_$_EpisodeResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}
