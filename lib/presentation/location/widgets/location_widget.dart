import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entities/location.dart';
import 'package:rick_and_morty/libraries/ui/character_chip_widget.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget(
      {super.key, required this.location, required this.theme});

  final Location location;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: DecoratedBox(
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      location.name,
                      maxLines: 2,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '#${location.id}',
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
              Text(
                'Type: ${location.type}',
                style: theme.textTheme.labelLarge
                    ?.copyWith(color: theme.colorScheme.surfaceTint),
              ),
              Text(
                location.dimension.contains('Dimension')
                    ? location.dimension
                    : 'Dimension ${location.dimension}',
                style: theme.textTheme.labelLarge
                    ?.copyWith(color: theme.colorScheme.surfaceTint),
              ),
              if (location.residents.isNotEmpty) const SizedBox(height: 16),
              if (location.residents.isNotEmpty)
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
                    itemCount: location.residents.length,
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final characterChip = location.residents[index];
                      return CharacterChipWidget(
                        chip: characterChip,
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
