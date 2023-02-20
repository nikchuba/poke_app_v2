import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/domain/entities/character_card.dart';
import 'package:rick_and_morty/domain/entities/character_chip.dart';
import 'package:rick_and_morty/internal/di/locator.dart';
import 'package:rick_and_morty/libraries/ui/abstracts/popup.dart';
import 'package:rick_and_morty/libraries/ui/fade_network_image.dart';
import 'package:rick_and_morty/libraries/ui/variables.dart';
import 'package:rick_and_morty/managers/character_manager.dart';

const _defaultPadding = 16.0;
const _defaultAnimationDuration = Duration(milliseconds: 300);

class CharacterDetailsPopupView extends PopupView {
  const CharacterDetailsPopupView({
    super.key,
    super.context,
    @PathParam('id') required this.id,
    this.card,
    this.chip,
  }) : super();

  final int id;
  final CharacterCard? card;
  final CharacterChip? chip;

  @override
  State<CharacterDetailsPopupView> createState() =>
      _CharacterDetailsPopupViewState();
}

class _CharacterDetailsPopupViewState extends State<CharacterDetailsPopupView> {
  ColorScheme get colorScheme => Theme.of(context).colorScheme;
  CharacterManager get manager => locator.get<CharacterManager>();

  @override
  void initState() {
    manager.updateCharacter(widget.id);
    super.initState();
  }

  @override
  void dispose() {
    manager.updateCharacter(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: colorScheme.background.withOpacity(.5),
      ),
      child: StreamBuilder(
        stream: manager.currentCharacter,
        builder: (context, snapshot) {
          final character = snapshot.data;

          return Stack(
            fit: StackFit.expand,
            children: [
              _buildImage(character),
              Positioned(
                bottom: _defaultPadding,
                left: _defaultPadding,
                right: _defaultPadding,
                child: AnimatedSwitcher(
                  duration: _defaultAnimationDuration,
                  child: character != null
                      ? Container(
                          clipBehavior: Clip.hardEdge,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              colors: [
                                colorScheme.surfaceVariant,
                                colorScheme.primaryContainer.withOpacity(0.7),
                              ],
                            ),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: DefaultTextStyle.merge(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color: colorScheme.onPrimaryContainer),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Center(
                                    child: Text(
                                      character.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                  Text(
                                    'Species: ${character.species}',
                                  ),
                                  Text(
                                    'Gender: ${character.gender.name}',
                                  ),
                                  Text(
                                    'Origin: ${character.origin.name}',
                                  ),
                                  Text(
                                    'Last location: ${character.location.name}',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : null,
                ),
              ),
              Positioned(
                top: _defaultPadding,
                left: _defaultPadding,
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
                      '#${widget.id}',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: colorScheme.onSurface),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: _defaultPadding,
                right: _defaultPadding,
                child: AnimatedSwitcher(
                  duration: _defaultAnimationDuration,
                  child: _buildStatus(character),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildImage(Character? character) {
    final image = character?.image ?? widget.card?.image ?? widget.chip?.image;
    return image != null
        ? FadeNetworkImage(
            image: image,
            errorImageSize: 40,
          )
        : const Center(child: CircularProgressIndicator());
  }

  Widget? _buildStatus(Character? character) {
    final status = character?.status ?? widget.card?.status;
    return status != null
        ? Container(
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),
            decoration: BoxDecoration(
              color: getStatusColor(status).withOpacity(.8),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Text(
                  status.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: colorScheme.onSurface),
                ),
              ],
            ),
          )
        : null;
  }
}
