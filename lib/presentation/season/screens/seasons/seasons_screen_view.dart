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

  final keys = List.generate(5, (index) => ValueKey('Tab-${index + 1}'));

  @override
  void initState() {
    presenter = context.read();
    scrollController = ScrollController();
    routes = List.generate(
      5,
      (index) => SeasonEpisodesTabView(
        key: keys.elementAt(index),
        seasonId: index + 1,
      ),
    );

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
    return AutoTabsRouter.tabBar(
      routes: routes,
      physics: const NeverScrollableScrollPhysics(),
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
                body: child,
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
