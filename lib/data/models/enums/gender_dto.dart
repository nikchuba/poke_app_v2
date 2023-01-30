import 'package:freezed_annotation/freezed_annotation.dart';

enum GenderDto {
  @JsonValue('Female')
  female,
  @JsonValue('Male')
  male,
  @JsonValue('Genderless')
  genderless,
  @JsonValue('unknown')
  unknown,
}
