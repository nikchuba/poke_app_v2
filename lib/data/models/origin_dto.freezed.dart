// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'origin_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OriginDto _$OriginDtoFromJson(Map<String, dynamic> json) {
  return _OriginDto.fromJson(json);
}

/// @nodoc
mixin _$OriginDto {
  String get name => throw _privateConstructorUsedError;
  Uri get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OriginDtoCopyWith<OriginDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OriginDtoCopyWith<$Res> {
  factory $OriginDtoCopyWith(OriginDto value, $Res Function(OriginDto) then) =
      _$OriginDtoCopyWithImpl<$Res, OriginDto>;
  @useResult
  $Res call({String name, Uri url});
}

/// @nodoc
class _$OriginDtoCopyWithImpl<$Res, $Val extends OriginDto>
    implements $OriginDtoCopyWith<$Res> {
  _$OriginDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OriginDtoCopyWith<$Res> implements $OriginDtoCopyWith<$Res> {
  factory _$$_OriginDtoCopyWith(
          _$_OriginDto value, $Res Function(_$_OriginDto) then) =
      __$$_OriginDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, Uri url});
}

/// @nodoc
class __$$_OriginDtoCopyWithImpl<$Res>
    extends _$OriginDtoCopyWithImpl<$Res, _$_OriginDto>
    implements _$$_OriginDtoCopyWith<$Res> {
  __$$_OriginDtoCopyWithImpl(
      _$_OriginDto _value, $Res Function(_$_OriginDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$_OriginDto(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OriginDto implements _OriginDto {
  const _$_OriginDto({required this.name, required this.url});

  factory _$_OriginDto.fromJson(Map<String, dynamic> json) =>
      _$$_OriginDtoFromJson(json);

  @override
  final String name;
  @override
  final Uri url;

  @override
  String toString() {
    return 'OriginDto(name: $name, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OriginDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OriginDtoCopyWith<_$_OriginDto> get copyWith =>
      __$$_OriginDtoCopyWithImpl<_$_OriginDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OriginDtoToJson(
      this,
    );
  }
}

abstract class _OriginDto implements OriginDto {
  const factory _OriginDto(
      {required final String name, required final Uri url}) = _$_OriginDto;

  factory _OriginDto.fromJson(Map<String, dynamic> json) =
      _$_OriginDto.fromJson;

  @override
  String get name;
  @override
  Uri get url;
  @override
  @JsonKey(ignore: true)
  _$$_OriginDtoCopyWith<_$_OriginDto> get copyWith =>
      throw _privateConstructorUsedError;
}
