import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/domain/entities/episode.dart';

import '../seasons_screen_presenter.dart';
import 'episode_widget.dart';

class SeasonEpisodesGridView extends StatefulWidget {
  const SeasonEpisodesGridView({
    super.key,
    @PathParam('id') required this.seasonId,
  });

  final int seasonId;

  @override
  State<SeasonEpisodesGridView> createState() => _SeasonEpisodesGridViewState();
}

class _SeasonEpisodesGridViewState extends State<SeasonEpisodesGridView> {
  SeasonsScreenPresenter get presenter => context.read();
  ColorScheme get colorScheme => Theme.of(context).colorScheme;

  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: colorScheme.surface,
      child: StreamBuilder(
        initialData: const <Episode>[],
        stream: presenter.currentSeason(widget.seasonId),
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
                    return EpisodeWidget(
                        episode: episode, theme: Theme.of(context));
                  },
                  itemCount: episodes.length,
                );
        },
      ),
    );
  }
}
