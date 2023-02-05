part of 'home_page.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        CharactersRoute(),
        EpisodesRoute(),
        LocationRoute(),
      ],
      builder: (context, child, animation) {
        final tabs = AutoTabsRouter.of(context);
        return Scaffold(
          body: Stack(
            children: [
              child,
              Positioned(
                right: 0,
                left: 0,
                bottom: 80 + 20,
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
                    currentIndex: tabs.activeIndex,
                    onTap: tabs.setActiveIndex,
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
              ),
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: InternetConnectionSnackbar(),
              ),
            ],
          ),
        );
      },
    );
  }
}
