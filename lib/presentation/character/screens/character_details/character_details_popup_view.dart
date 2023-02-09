import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entities/character_card.dart';
import 'package:rick_and_morty/libraries/ui/abstracts/popup.dart';
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
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: card?.image ?? '',
        fit: BoxFit.cover,
      ),
    );
  }
}
