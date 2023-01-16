import 'character_card.dart';

abstract class ILocation {
  const ILocation({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;
}

class Location extends ILocation {
  const Location({
    required this.id,
    required super.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required super.url,
  });

  final int id;
  final String type;
  final String dimension;
  final List<CharacterCard> residents;
}
