import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entities/episode.dart';
import 'package:rick_and_morty/libraries/ui/character_chip_widget.dart';

class EpisodeWidget extends StatelessWidget {
  const EpisodeWidget({super.key, required this.episode, required this.theme});

  final Episode episode;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: theme.colorScheme.surfaceVariant.withOpacity(.6),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.surfaceVariant.withOpacity(.9),
            blurRadius: 16,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  episode.name,
                  maxLines: 2,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '#${episode.id}',
                style: theme.textTheme.displayLarge?.copyWith(
                  shadows: [
                    BoxShadow(
                      color: theme.colorScheme.surfaceTint.withOpacity(.2),
                      blurRadius: 16,
                    ),
                  ],
                  fontSize: 32,
                  color: theme.colorScheme.surfaceTint,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            'Air date: ${episode.airDate}',
            style: theme.textTheme.labelLarge
                ?.copyWith(color: theme.colorScheme.surfaceTint),
          ),
          const SizedBox(height: 16),
          Container(
            height: 80,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceVariant.withOpacity(.4),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.surfaceTint.withOpacity(.25),
                  blurRadius: 12,
                ),
              ],
            ),
            child: ListView.separated(
              separatorBuilder: (context, _) => const SizedBox(width: 8),
              itemCount: episode.characters.length,
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final characterChip = episode.characters[index];
                return CharacterChipWidget(
                  chip: characterChip,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
