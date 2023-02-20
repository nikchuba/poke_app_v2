import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entities/enums/status.dart';
import 'package:rick_and_morty/libraries/ui/variables.dart';

class CharacterStatusWidget extends StatelessWidget {
  const CharacterStatusWidget({super.key, required this.status});

  final Status status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
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
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
