part of 'seasons_screen.dart';

class SeasonsScreenView extends StatefulWidget {
  const SeasonsScreenView({super.key});

  @override
  State<SeasonsScreenView> createState() => _SeasonsScreenViewState();
}

class _SeasonsScreenViewState extends State<SeasonsScreenView>
    with TickerProviderStateMixin {
  ColorScheme get colorScheme => Theme.of(context).colorScheme;
  TextTheme get textTheme => Theme.of(context).textTheme;
  Color get background => Theme.of(context).colorScheme.surface;
  Color get shadowColor => Theme.of(context).colorScheme.surfaceTint;
  late final SeasonsScreenPresenter presenter;

  late List<PageRouteInfo> routes;
  late final ScrollController scrollController;
  Map<int, Widget>? segmentedControls;

  @override
  void initState() {
    presenter = context.read();
    scrollController = ScrollController();
    routes = [
      SeasonEpisodesTabView(key: const ValueKey(1), seasonId: 1),
      SeasonEpisodesTabView(key: const ValueKey(2), seasonId: 2),
      SeasonEpisodesTabView(key: const ValueKey(3), seasonId: 3),
      SeasonEpisodesTabView(key: const ValueKey(4), seasonId: 4),
      SeasonEpisodesTabView(key: const ValueKey(5), seasonId: 5),
    ];

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    segmentedControls ??= _buildSegmentedControls();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: routes,
      // animatePageTransition: true,
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        presenter.season = tabsRouter.activeIndex;
        return Scaffold(
          body: Stack(
            children: [
              ExtendedNestedScrollView(
                onlyOneScrollInBody: true,
                controller: scrollController,
                headerSliverBuilder: (context, _) => [
                  BlurredSliverAppBar(
                    title: 'Seasons',
                    bottom: PreferredSize(
                      preferredSize: const Size(300, 52),
                      child: CupertinoSlidingSegmentedControl<int>(
                        children: segmentedControls!,
                        onValueChanged: (value) =>
                            tabsRouter.setActiveIndex(value!),
                        padding: const EdgeInsets.all(6),
                        groupValue: tabsRouter.activeIndex,
                        backgroundColor: Colors.transparent,
                        thumbColor: colorScheme.surfaceTint.withOpacity(.7),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 10),
                  ),
                ],
                body: ExtendedVisibilityDetector(
                  uniqueKey: ValueKey('Tab-${tabsRouter.activeIndex}'),
                  child: FadeTransition(
                    opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve:
                            const Interval(0.0, 1.0, curve: Curves.decelerate),
                      ),
                    ),
                    child: ScaleTransition(
                      scale: Tween<double>(begin: 0.7, end: 1.0).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: const Interval(0, 1.0,
                              curve: Curves.decelerate),
                        ),
                      ),
                      child: child,
                    ),
                  ),
                ),
              ),
              LoadingIndicator(
                isLoading: presenter.loadingController,
              )
            ],
          ),
        );
      },
    );
  }

  Map<int, Widget> _buildSegmentedControls() {
    return routes.asMap().map((key, value) => MapEntry(
        key,
        Container(
          height: 40,
          alignment: Alignment.center,
          child: Text('${key + 1}', style: textTheme.bodyLarge),
        )));
  }
}
