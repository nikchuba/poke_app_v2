// import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/internal/di/locator.dart';
import 'package:rick_and_morty/libraries/ui/blurred_sliver_app_bar.dart';
import 'package:rick_and_morty/libraries/ui/widgets/loading_indicator.dart';
import 'package:rick_and_morty/managers/episode_manager.dart';
import 'package:rick_and_morty/navigation/app_router.dart';

import 'seasons_screen_presenter.dart';

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
    routes = List.generate(
      5,
      (index) => SeasonEpisodesTabView(seasonId: index + 1),
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
    return Stack(
      children: [
        AutoTabsRouter.tabBar(
          routes: routes,
          builder: (context, child, animation) {
            final tabsRouter = AutoTabsRouter.of(context);
            presenter.changeSeason(tabsRouter.activeIndex + 1);
            return Scaffold(
              body: ExtendedNestedScrollView(
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
            );
          },
        ),
        LoadingIndicator(
          isLoading: presenter.loadingController,
        )
      ],
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
