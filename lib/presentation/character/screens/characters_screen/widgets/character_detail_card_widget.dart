import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entities/character_card.dart';
import 'package:rick_and_morty/domain/entities/enums/status.dart';
import 'package:rick_and_morty/libraries/ui/variables.dart';

import '../characters_page.dart';

class CharacterCardDetailPage extends StatefulWidget {
  const CharacterCardDetailPage({
    super.key,
  });

  // final CharacterCard card;

  @override
  State<CharacterCardDetailPage> createState() =>
      _CharacterCardDetailPageState();
}

class _CharacterCardDetailPageState extends State<CharacterCardDetailPage> {
  ColorScheme get colorScheme => Theme.of(context).colorScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      // The blue background emphasizes that it's a new route.
      color: Colors.transparent,
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.topLeft,
      child: PhotoHero(
        icon: Icons.access_time_filled_outlined,
        width: 100.0,
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Color getStatusColor(Status status) {
    switch (status) {
      case Status.alive:
        return Colors.green;
      case Status.dead:
        return Colors.red;
      case Status.unknown:
        return Colors.grey;
    }
  }
}
