part of 'seasons_page.dart';

class SeasonsPageView extends StatefulWidget {
  const SeasonsPageView({super.key});

  @override
  State<SeasonsPageView> createState() => _SeasonsPageViewState();
}

class _SeasonsPageViewState extends State<SeasonsPageView>
    with TickerProviderStateMixin {
  ColorScheme get colorScheme => Theme.of(context).colorScheme;
  TextTheme get textTheme => Theme.of(context).textTheme;
  Color get background => Theme.of(context).colorScheme.surface;
  Color get shadowColor => Theme.of(context).colorScheme.surfaceTint;

  late final SeasonsPagePresenter presenter;
  late final ScrollController scrollController;

  @override
  void initState() {
    presenter = context.read();
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        SeasonRoute(id: 1),
        SeasonRoute(id: 2),
        SeasonRoute(id: 3),
        SeasonRoute(id: 4),
        SeasonRoute(id: 5),
      ],
      builder: (context, child, animation) {
        // scrollController.
        final tabsRouter = AutoTabsRouter.of(context);
        presenter.season = tabsRouter.activeIndex;
        final controls = [0, 1, 2, 3, 4].asMap().map(
              (key, value) => MapEntry(
                key,
                SizedBox(
                    height: 40,
                    child: Center(
                        child: Text('${key + 1}', style: textTheme.bodyLarge))),
              ),
            );
        return Scaffold(
          body: Stack(
            children: [
              ExtendedNestedScrollView(
                onlyOneScrollInBody: true,
                controller: scrollController,
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  BlurredSliverAppBar(
                    title: 'Seasons',
                    bottom: PreferredSize(
                      preferredSize: const Size(300, 52),
                      child: CupertinoSlidingSegmentedControl<int>(
                        children: controls,
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
                    child: SizedBox(
                      height: 10,
                    ),
                  )
                ],
                body: FadeTransition(
                  opacity: animation,
                  child: ExtendedVisibilityDetector(
                    uniqueKey: ValueKey('Tab-${tabsRouter.activeIndex}'),
                    child: child,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
