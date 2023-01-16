import 'package:freezed_annotation/freezed_annotation.dart';

enum GenderDto {
  @JsonValue('female')
  female,
  @JsonValue('male')
  male,
  @JsonValue('genderless')
  genderless,
  @JsonValue('unknown')
  unknown,
}
