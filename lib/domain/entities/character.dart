import 'package:rick_and_morty/domain/entities/location.dart';

import 'character_card.dart';

class Character extends CharacterCard {
  const Character({
    required super.id,
    required super.name,
    required super.status,
    required super.image,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.episodes,
  });

  final String species;
  final String type;
  final String gender;
  final ILocation origin;
  final ILocation location;
  final List<String> episodes;
}
