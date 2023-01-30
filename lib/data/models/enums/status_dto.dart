import 'package:freezed_annotation/freezed_annotation.dart';

enum StatusDto {
  @JsonValue('Alive')
  alive,
  @JsonValue('Dead')
  dead,
  @JsonValue('unknown')
  unknown,
}
