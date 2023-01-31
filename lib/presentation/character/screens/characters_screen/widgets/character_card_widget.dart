import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rick_and_morty/domain/entities/character_card.dart';
import 'package:rick_and_morty/domain/entities/enums/status.dart';

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
            fit: BoxFit.contain,
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

final kTransparentImage = Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);
