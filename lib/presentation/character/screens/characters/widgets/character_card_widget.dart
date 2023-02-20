import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entities/character_card.dart';
import 'package:rick_and_morty/libraries/ui/fade_network_image.dart';
import 'package:rick_and_morty/libraries/ui/variables.dart';
import 'package:rick_and_morty/libraries/ui/widgets/character_status_widget.dart';
import 'package:rick_and_morty/navigation/app_router.dart';

class CharacterCardWidget extends StatefulWidget {
  const CharacterCardWidget({super.key, required this.card});

  final CharacterCard card;

  @override
  State<CharacterCardWidget> createState() => _CharacterCardWidgetState();
}

class _CharacterCardWidgetState extends State<CharacterCardWidget> {
  ColorScheme get colorScheme => Theme.of(context).colorScheme;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        context.pushRoute(CharacterDetailsPopup(
          id: widget.card.id,
          context: context,
          card: widget.card,
        ));
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: colorScheme.surfaceVariant.withOpacity(.4),
            boxShadow: [
              BoxShadow(
                color: colorScheme.surfaceVariant.withOpacity(.7),
                blurStyle: BlurStyle.outer,
                blurRadius: 12,
              ),
            ]),
        child: Stack(
          fit: StackFit.expand,
          children: [
            FadeNetworkImage(
              image: widget.card.image,
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
                  widget.card.name,
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
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceVariant.withOpacity(.8),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    '#${widget.card.id}',
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
              child: CharacterStatusWidget(
                status: widget.card.status,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
