// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EpisodeDto _$EpisodeDtoFromJson(Map<String, dynamic> json) {
  return _EpisodeDto.fromJson(json);
}

/// @nodoc
mixin _$EpisodeDto {
  int get id => throw _privateConstructorUsedError;
  String get name =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'air_date')
  String get airDate => throw _privateConstructorUsedError;
  String get episode => throw _privateConstructorUsedError;
  List<Uri> get characters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpisodeDtoCopyWith<EpisodeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeDtoCopyWith<$Res> {
  factory $EpisodeDtoCopyWith(
          EpisodeDto value, $Res Function(EpisodeDto) then) =
      _$EpisodeDtoCopyWithImpl<$Res, EpisodeDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'air_date') String airDate,
      String episode,
      List<Uri> characters});
}

/// @nodoc
class _$EpisodeDtoCopyWithImpl<$Res, $Val extends EpisodeDto>
    implements $EpisodeDtoCopyWith<$Res> {
  _$EpisodeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? airDate = null,
    Object? episode = null,
    Object? characters = null,
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
      airDate: null == airDate
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as String,
      episode: null == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as String,
      characters: null == characters
          ? _value.characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<Uri>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EpisodeDtoCopyWith<$Res>
    implements $EpisodeDtoCopyWith<$Res> {
  factory _$$_EpisodeDtoCopyWith(
          _$_EpisodeDto value, $Res Function(_$_EpisodeDto) then) =
      __$$_EpisodeDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'air_date') String airDate,
      String episode,
      List<Uri> characters});
}

/// @nodoc
class __$$_EpisodeDtoCopyWithImpl<$Res>
    extends _$EpisodeDtoCopyWithImpl<$Res, _$_EpisodeDto>
    implements _$$_EpisodeDtoCopyWith<$Res> {
  __$$_EpisodeDtoCopyWithImpl(
      _$_EpisodeDto _value, $Res Function(_$_EpisodeDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? airDate = null,
    Object? episode = null,
    Object? characters = null,
  }) {
    return _then(_$_EpisodeDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      airDate: null == airDate
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as String,
      episode: null == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as String,
      characters: null == characters
          ? _value._characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<Uri>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EpisodeDto implements _EpisodeDto {
  const _$_EpisodeDto(
      {required this.id,
      required this.name,
      @JsonKey(name: 'air_date') required this.airDate,
      required this.episode,
      required final List<Uri> characters})
      : _characters = characters;

  factory _$_EpisodeDto.fromJson(Map<String, dynamic> json) =>
      _$$_EpisodeDtoFromJson(json);

  @override
  final int id;
  @override
  final String name;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'air_date')
  final String airDate;
  @override
  final String episode;
  final List<Uri> _characters;
  @override
  List<Uri> get characters {
    if (_characters is EqualUnmodifiableListView) return _characters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_characters);
  }

  @override
  String toString() {
    return 'EpisodeDto(id: $id, name: $name, airDate: $airDate, episode: $episode, characters: $characters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EpisodeDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.airDate, airDate) || other.airDate == airDate) &&
            (identical(other.episode, episode) || other.episode == episode) &&
            const DeepCollectionEquality()
                .equals(other._characters, _characters));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, airDate, episode,
      const DeepCollectionEquality().hash(_characters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EpisodeDtoCopyWith<_$_EpisodeDto> get copyWith =>
      __$$_EpisodeDtoCopyWithImpl<_$_EpisodeDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EpisodeDtoToJson(
      this,
    );
  }
}

abstract class _EpisodeDto implements EpisodeDto {
  const factory _EpisodeDto(
      {required final int id,
      required final String name,
      @JsonKey(name: 'air_date') required final String airDate,
      required final String episode,
      required final List<Uri> characters}) = _$_EpisodeDto;

  factory _EpisodeDto.fromJson(Map<String, dynamic> json) =
      _$_EpisodeDto.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'air_date')
  String get airDate;
  @override
  String get episode;
  @override
  List<Uri> get characters;
  @override
  @JsonKey(ignore: true)
  _$$_EpisodeDtoCopyWith<_$_EpisodeDto> get copyWith =>
      throw _privateConstructorUsedError;
}
