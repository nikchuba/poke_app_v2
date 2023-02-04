part of 'season_page.dart';

class SeasonPageView extends StatefulWidget {
  const SeasonPageView({super.key, required this.id});

  final int id;

  @override
  State<SeasonPageView> createState() => _SeasonPageViewState();
}

class _SeasonPageViewState extends State<SeasonPageView> {
  EpisodesPagePresenter get presenter => context.read();
  ColorScheme get colorScheme => Theme.of(context).colorScheme;
  TextTheme get textTheme => Theme.of(context).textTheme;

  @override
  void initState() {
    presenter.getEpisodesBySeason(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: presenter.loadingController,
        builder: (context, loading) {
          return StreamBuilder(
            initialData: const <Episode>[],
            stream: presenter.episodesController,
            builder: (context, snapshot) {
              final episodes = snapshot.data!;
              // if (episodes.isEmpty) {
              //   return StreamBuilder(
              //     initialData: false,
              //     stream: presenter.loadingController,
              //     builder: (context, snap) {
              //       return SliverPadding(
              //         padding: const EdgeInsets.only(bottom: 16),
              //         child: Center(
              //           child: snap.data == true
              //               ? const CircularProgressIndicator()
              //               : null,
              //         ),
              //       );
              //     },
              //   );
              // }
              return SliverPadding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 80 + 32,
                ),
                sliver: loading.data == true || episodes.isEmpty
                    ? const SliverToBoxAdapter(
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 450,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          mainAxisExtent: 200,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final episode = episodes[index];
                            final number =
                                int.parse(episode.code.split('E').last);
                            return Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color:
                                    colorScheme.surfaceVariant.withOpacity(.6),
                                boxShadow: [
                                  BoxShadow(
                                    color: colorScheme.surfaceVariant
                                        .withOpacity(.9),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          episode.name,
                                          maxLines: 2,
                                          style:
                                              textTheme.titleMedium?.copyWith(
                                            color:
                                                colorScheme.onPrimaryContainer,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        '#$number',
                                        style: textTheme.displayLarge?.copyWith(
                                          shadows: [
                                            BoxShadow(
                                              color: colorScheme.surfaceTint
                                                  .withOpacity(.2),
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
                                    style: textTheme.labelLarge?.copyWith(
                                        color: colorScheme.surfaceTint),
                                  ),
                                  const SizedBox(height: 16),
                                  Container(
                                    height: 80,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      color: colorScheme.surfaceVariant
                                          .withOpacity(.4),
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                          color: colorScheme.surfaceTint
                                              .withOpacity(.25),
                                          blurRadius: 12,
                                        ),
                                      ],
                                    ),
                                    child: ListView.separated(
                                      padding: const EdgeInsets.all(8),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final characterCard =
                                            episode.characters[index];
                                        return Container(
                                          key: ValueKey(characterCard.id),
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
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
                          childCount: episodes.length,
                        ),
                      ),
              );
            },
          );
        });
  }
}
