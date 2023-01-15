// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResponseInfoDto _$ResponseInfoDtoFromJson(Map<String, dynamic> json) {
  return _ResponseInfoDto.fromJson(json);
}

/// @nodoc
mixin _$ResponseInfoDto {
  int get count => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get prev => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseInfoDtoCopyWith<ResponseInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseInfoDtoCopyWith<$Res> {
  factory $ResponseInfoDtoCopyWith(
          ResponseInfoDto value, $Res Function(ResponseInfoDto) then) =
      _$ResponseInfoDtoCopyWithImpl<$Res, ResponseInfoDto>;
  @useResult
  $Res call({int count, int pages, String? next, String? prev});
}

/// @nodoc
class _$ResponseInfoDtoCopyWithImpl<$Res, $Val extends ResponseInfoDto>
    implements $ResponseInfoDtoCopyWith<$Res> {
  _$ResponseInfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? pages = null,
    Object? next = freezed,
    Object? prev = freezed,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResponseInfoDtoCopyWith<$Res>
    implements $ResponseInfoDtoCopyWith<$Res> {
  factory _$$_ResponseInfoDtoCopyWith(
          _$_ResponseInfoDto value, $Res Function(_$_ResponseInfoDto) then) =
      __$$_ResponseInfoDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, int pages, String? next, String? prev});
}

/// @nodoc
class __$$_ResponseInfoDtoCopyWithImpl<$Res>
    extends _$ResponseInfoDtoCopyWithImpl<$Res, _$_ResponseInfoDto>
    implements _$$_ResponseInfoDtoCopyWith<$Res> {
  __$$_ResponseInfoDtoCopyWithImpl(
      _$_ResponseInfoDto _value, $Res Function(_$_ResponseInfoDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? pages = null,
    Object? next = freezed,
    Object? prev = freezed,
  }) {
    return _then(_$_ResponseInfoDto(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResponseInfoDto implements _ResponseInfoDto {
  const _$_ResponseInfoDto(
      {required this.count, required this.pages, this.next, this.prev});

  factory _$_ResponseInfoDto.fromJson(Map<String, dynamic> json) =>
      _$$_ResponseInfoDtoFromJson(json);

  @override
  final int count;
  @override
  final int pages;
  @override
  final String? next;
  @override
  final String? prev;

  @override
  String toString() {
    return 'ResponseInfoDto(count: $count, pages: $pages, next: $next, prev: $prev)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResponseInfoDto &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, pages, next, prev);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResponseInfoDtoCopyWith<_$_ResponseInfoDto> get copyWith =>
      __$$_ResponseInfoDtoCopyWithImpl<_$_ResponseInfoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResponseInfoDtoToJson(
      this,
    );
  }
}

abstract class _ResponseInfoDto implements ResponseInfoDto {
  const factory _ResponseInfoDto(
      {required final int count,
      required final int pages,
      final String? next,
      final String? prev}) = _$_ResponseInfoDto;

  factory _ResponseInfoDto.fromJson(Map<String, dynamic> json) =
      _$_ResponseInfoDto.fromJson;

  @override
  int get count;
  @override
  int get pages;
  @override
  String? get next;
  @override
  String? get prev;
  @override
  @JsonKey(ignore: true)
  _$$_ResponseInfoDtoCopyWith<_$_ResponseInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}
