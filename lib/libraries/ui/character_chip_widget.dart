import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entities/character_chip.dart';
import 'package:rick_and_morty/libraries/ui/fade_network_image.dart';
import 'package:rick_and_morty/navigation/app_router.dart';

class CharacterChipWidget extends StatefulWidget {
  const CharacterChipWidget({super.key, required this.chip});

  final CharacterChip chip;

  @override
  State<CharacterChipWidget> createState() => _CharacterChipWidgetState();
}

class _CharacterChipWidgetState extends State<CharacterChipWidget> {
  ColorScheme get colorScheme => Theme.of(context).colorScheme;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        context.pushRoute(
          CharacterDetailsPopup(
            context: context,
            id: widget.chip.id,
            chip: widget.chip,
          ),
        );
      },
      child: Container(
        constraints: const BoxConstraints(minHeight: 64, minWidth: 64),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: colorScheme.onSecondary.withOpacity(.3),
          borderRadius: BorderRadius.circular(24),
        ),
        child: FadeNetworkImage(image: widget.chip.image),
      ),
    );
  }
}
