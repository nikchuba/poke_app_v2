import 'package:auto_route/auto_route.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/domain/entities/episode.dart';
import 'package:rick_and_morty/libraries/ui/variables.dart';

import '../seasons/seasons_screen.dart';

class SeasonEpisodesView extends StatefulWidget {
  const SeasonEpisodesView({
    super.key,
    @PathParam('id') required this.seasonId,
  });

  final int seasonId;

  @override
  State<SeasonEpisodesView> createState() => _SeasonEpisodesViewState();
}

class _SeasonEpisodesViewState extends State<SeasonEpisodesView> {
  SeasonsScreenPresenter get presenter => context.read();
  ColorScheme get colorScheme => Theme.of(context).colorScheme;
  TextTheme get textTheme => Theme.of(context).textTheme;

  @override
  void initState() {
    if (!presenter.seasonsController[widget.seasonId - 1].hasValue) {
      presenter.getEpisodesBySeason(widget.seasonId);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExtendedVisibilityDetector(
      uniqueKey: ValueKey('Tab-${widget.seasonId}'),
      child: ColoredBox(
        color: colorScheme.surface,
        child: StreamBuilder(
          initialData: const <Episode>[],
          stream: presenter.seasonsController[widget.seasonId - 1],
          builder: (context, snapshot) {
            final episodes = snapshot.data!;
            return episodes.isEmpty
                ? const SizedBox()
                : GridView.builder(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                      bottom: 80 + 32,
                    ),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 450,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      mainAxisExtent: 200,
                    ),
                    itemBuilder: (context, index) {
                      final episode = episodes[index];
                      final number = episode.id;
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: colorScheme.surfaceVariant.withOpacity(.6),
                          boxShadow: [
                            BoxShadow(
                              color: colorScheme.surfaceVariant.withOpacity(.9),
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
                                    style: textTheme.titleMedium?.copyWith(
                                      color: colorScheme.onPrimaryContainer,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '#$number',
                                  style: textTheme.displayLarge?.copyWith(
                                    shadows: [
                                      BoxShadow(
                                        color:
                                            colorScheme.surfaceTint.withOpacity(.2),
                                        blurRadius: 16,
                                      ),
                                    ],
                                    fontSize: 32,
                                    color: colorScheme.surfaceTint,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              'Air date: ${episode.airDate}',
                              style: textTheme.labelLarge
                                  ?.copyWith(color: colorScheme.surfaceTint),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              height: 80,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                color: colorScheme.surfaceVariant.withOpacity(.4),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: colorScheme.surfaceTint.withOpacity(.25),
                                    blurRadius: 12,
                                  ),
                                ],
                              ),
                              child: ListView.separated(
                                padding: const EdgeInsets.all(8),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final characterCard = episode.characters[index];
                                  return Container(
                                    key: ValueKey(characterCard.id),
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: FadeInImage.memoryNetwork(
                                      placeholder: kTransparentImage,
                                      image: characterCard.image,
                                      fit: BoxFit.cover,
                                      filterQuality: FilterQuality.high,
                                    ),
                                  );
                                },
                                separatorBuilder: (context, _) =>
                                    const SizedBox(width: 8),
                                itemCount: episode.characters.length,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: episodes.length,
                  );
          },
        ),
      ),
    );
  }
}
