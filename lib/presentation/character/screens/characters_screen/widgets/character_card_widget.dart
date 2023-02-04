import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rick_and_morty/domain/entities/character_card.dart';
import 'package:rick_and_morty/domain/entities/enums/status.dart';
import 'package:rick_and_morty/libraries/ui/variables.dart';

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
    return Container(
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
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: widget.card.image,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
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
            child: Container(
              clipBehavior: Clip.hardEdge,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: getStatusColor(widget.card.status).withOpacity(.8),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Text(
                    widget.card.status.name,
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
