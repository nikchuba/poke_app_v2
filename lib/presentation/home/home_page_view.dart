part of 'home_page.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: [
        CharactersRoute(),
        EpisodeRoute(),
        LocationRoute(),
      ],
      builder: (context, child, controller) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: Stack(
            children: [
              child,
              Positioned(
                top: 56,
                right: 0,
                child: ValueListenableBuilder<AdaptiveThemeMode>(
                  valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
                  builder: (context, snapshot, _) {
                    return Switch(
                      value: snapshot.isDark,
                      onChanged: (value) {
                        if (value) {
                          AdaptiveTheme.of(context).setDark();
                        } else {
                          AdaptiveTheme.of(context).setLight();
                        }
                      },
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: BottomNavBar(
                    currentIndex: tabsRouter.activeIndex,
                    onTap: tabsRouter.setActiveIndex,
                    items: [
                      BottomNavBarItem(
                        activeIcon: const Icon(Icons.person_2),
                        inactiveIcon: const Icon(Icons.person_2_outlined),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      BottomNavBarItem(
                        activeIcon: const Icon(Icons.book),
                        inactiveIcon: const Icon(Icons.book_outlined),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      BottomNavBarItem(
                        activeIcon: const Icon(Icons.location_on),
                        inactiveIcon: const Icon(Icons.location_on_outlined),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
