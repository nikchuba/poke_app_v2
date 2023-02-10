import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entities/character_card.dart';
import 'package:rick_and_morty/libraries/ui/abstracts/popup.dart';
import 'package:rick_and_morty/libraries/ui/fade_network_image.dart';
import 'package:rick_and_morty/libraries/ui/variables.dart';

class CharacterDetailsPopupView extends PopupView {
  const CharacterDetailsPopupView({
    super.key,
    super.context,
    @PathParam('id') required this.id,
    this.card,
  }) : super();

  final int id;
  final CharacterCard? card;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: colorScheme.background,
      ),
      child: card != null
          ? Stack(
              fit: StackFit.expand,
              children: [
                FadeNetworkImage(
                  image: card!.image,
                  errorImageSize: 40,
                ),
                Positioned(
                  bottom: -1,
                  left: 0,
                  right: 0,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        tileMode: TileMode.mirror,
                        colors: [
                          colorScheme.surfaceVariant,
                          colorScheme.primaryContainer.withOpacity(.5),
                        ],
                      ),
                    ),
                    child: Text(
                      card!.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: colorScheme.onSurface),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceVariant.withOpacity(.8),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        '#${card!.id}',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: colorScheme.onSurface),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: getStatusColor(card!.status).withOpacity(.8),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Text(
                          card!.status.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: colorScheme.onSurface),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : null,
    );
  }
}
