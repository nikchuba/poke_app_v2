import 'package:rick_and_morty/data/models/enums/gender_dto.dart';
import 'package:rick_and_morty/data/models/enums/status_dto.dart';
import 'package:rick_and_morty/domain/entities/enums/gender.dart';
import 'package:rick_and_morty/domain/entities/enums/status.dart';

Status mapStatus(StatusDto dto) {
  switch (dto) {
    case StatusDto.alive:
      return Status.alive;
    case StatusDto.dead:
      return Status.dead;
    case StatusDto.unknown:
      return Status.unknown;
  }
}

StatusDto? mapStatusDto(Status? status) {
  switch (status) {
    case Status.alive:
      return StatusDto.alive;
    case Status.dead:
      return StatusDto.dead;
    case Status.unknown:
      return StatusDto.unknown;
    default:
      return null;
  }
}

Gender mapGender(GenderDto dto) {
  switch (dto) {
    case GenderDto.female:
      return Gender.female;
    case GenderDto.male:
      return Gender.male;
    case GenderDto.genderless:
      return Gender.genderless;
    case GenderDto.unknown:
      return Gender.unknown;
  }
}

GenderDto? mapGenderDto(Gender? gender) {
  switch (gender) {
    case Gender.female:
      return GenderDto.female;
    case Gender.male:
      return GenderDto.male;
    case Gender.genderless:
      return GenderDto.genderless;
    case Gender.unknown:
      return GenderDto.unknown;
    default:
      return null;
  }
}
