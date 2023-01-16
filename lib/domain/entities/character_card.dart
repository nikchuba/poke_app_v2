import 'enums/status.dart';

class CharacterCard {
  const CharacterCard({
    required this.id,
    required this.name,
    required this.status,
    required this.image,
  });

  final int id;
  final String name;
  final Status status;
  final String image;
}
