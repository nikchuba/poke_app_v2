part of 'episodes_page.dart';

class EpisodesPageView extends StatefulWidget {
  const EpisodesPageView({super.key});

  @override
  State<EpisodesPageView> createState() => _EpisodesPageViewState();
}

class _EpisodesPageViewState extends State<EpisodesPageView> {
  ColorScheme get colorScheme => Theme.of(context).colorScheme;
  TextTheme get textTheme => Theme.of(context).textTheme;
  Color get background => Theme.of(context).colorScheme.surface;
  Color get shadowColor => Theme.of(context).colorScheme.surfaceTint;
  late final ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.builder(
      routes: [
        SeasonRoute(id: 1),
        SeasonRoute(id: 2),
        SeasonRoute(id: 3),
        SeasonRoute(id: 4),
        SeasonRoute(id: 5),
      ],
      builder: (context, list, _) {
        final controls = list.asMap().map(
              (key, value) => MapEntry(
                key,
                SizedBox(height:40, child: Center(child: Text('${key + 1}', style: textTheme.bodyLarge))),
              ),
            );
        final tabs = AutoTabsRouter.of(context);
        return Scaffold(
          body: Stack(
            children: [
              CustomScrollView(
                controller: controller,
                slivers: [
                  BlurredSliverAppBar(
                    title: 'Seasons',
                    bottom: CupertinoSlidingSegmentedControl(
                      children: controls,
                      onValueChanged: (value) =>
                          tabs.setActiveIndex(value ?? 0),
                      padding: const EdgeInsets.all(6),
                      groupValue: tabs.activeIndex,
                      thumbColor: colorScheme.surfaceTint.withOpacity(.4),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 16),
                  ),
                  list[tabs.activeIndex],
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
