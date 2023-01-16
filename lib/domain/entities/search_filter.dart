import 'package:rick_and_morty/domain/entities/enums/gender.dart';

import 'enums/status.dart';

abstract class IFilter {
  const IFilter({this.name});
  final String? name;
}

class SearchFilter<T extends IFilter> {
  SearchFilter(this.filter);
  final T filter;
}

class CharacterFilter extends IFilter {
  const CharacterFilter({
    super.name,
    this.status,
    this.species,
    this.type,
    this.gender,
  });
  final Status? status;
  final String? species;
  final String? type;
  final Gender? gender;
}

class EpisodeFilter extends IFilter {
  const EpisodeFilter({
    super.name,
    this.episode,
  });
  final String? episode;
}

class LocationFilter extends IFilter {
  const LocationFilter({
    super.name,
    this.type,
    this.dimension,
  });
  final String? type;
  final String? dimension;
}
