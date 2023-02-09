import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty/domain/entities/character_card.dart';
import 'package:rick_and_morty/libraries/ui/variables.dart';
import 'package:rick_and_morty/navigation/app_router.dart';

class CharacterCardWidget extends StatelessWidget {
  const CharacterCardWidget({super.key, required this.card});

  final CharacterCard card;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        context.pushRoute(
          CharacterDetailsPopup(
            context: context,
            id: card.id,
            card: card,
          ),
        );
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: card.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
