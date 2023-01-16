import 'package:freezed_annotation/freezed_annotation.dart';

enum StatusDto {
  @JsonValue('alive')
  alive,
  @JsonValue('dead')
  dead,
  @JsonValue('unknown')
  unknown,
}
