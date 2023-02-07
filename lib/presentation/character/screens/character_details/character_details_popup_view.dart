import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entities/character_card.dart';
import 'package:rick_and_morty/libraries/ui/variables.dart';

class CharacterDetailsPopupView extends StatelessWidget {
  const CharacterDetailsPopupView({
    Key? key,
    @PathParam('id') required this.id,
    @queryParam this.card,
    @queryParam RenderBox? cardRenderBox,
  }) : super(key: key);

  final int id;
  final CharacterCard? card;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        // color: colorScheme.surfaceVariant.withOpacity(.4),
        // boxShadow: [
        //   BoxShadow(
        //     color: Theme.of(context).colorScheme.surfaceTint.withOpacity(1),
        //     blurStyle: BlurStyle.outer,
        //     blurRadius: 12,
        //   ),
        // ],
      ),
      child: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: card?.image ?? '',
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}
