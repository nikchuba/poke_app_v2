part of 'home_page.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      resizeToAvoidBottomInset: false,
      routes: [
        CharactersRoute(),
        EpisodeRoute(),
        LocationRoute(),
      ],
      builder: (context, child, animation) {
        return SafeArea(
          bottom: false,
          child: Stack(
            children: [
              child,
              Positioned(
                right: 0,
                child: ValueListenableBuilder<AdaptiveThemeMode>(
                    valueListenable:
                        AdaptiveTheme.of(context).modeChangeNotifier,
                    builder: (context, snapshot, _) {
                      return Switch(
                        value: snapshot.isDark,
                        onChanged: (_) {
                          AdaptiveTheme.of(context).toggleThemeMode();
                        },
                      );
                    }),
              )
            ],
          ),
        );
      },
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavBarItem(
              activeIcon: Icon(Icons.person_2),
              inactiveIcon: Icon(Icons.person_2_outlined),
            ),
            BottomNavBarItem(
              activeIcon: Icon(Icons.book),
              inactiveIcon: Icon(Icons.book_outlined),
            ),
            BottomNavBarItem(
              activeIcon: Icon(Icons.location_on),
              inactiveIcon: Icon(Icons.location_on_outlined),
            ),
          ],
        );
      },
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {super.key,
      required this.currentIndex,
      required this.onTap,
      required this.items});

  final int currentIndex;
  final Function(int) onTap;
  final List<BottomNavBarItem> items;

  @override
  Widget build(BuildContext context) {
    final tintColor = Theme.of(context).colorScheme.surfaceTint;

    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      height: 80,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: tintColor.withOpacity(.5),
            blurRadius: 20,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: items.asMap().entries.map((entry) {
                final key = entry.key;
                final child = entry.value;
                return currentIndex == key
                    ? child.activeIcon
                    : child.inactiveIcon;
              }).toList(),
            ),
          ),
          Center(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: tintColor.withOpacity(.25),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 10, sigmaY: 10, tileMode: TileMode.mirror),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: items.asMap().entries.map((entry) {
                    final key = entry.key;
                    final child = entry.value;
                    return CupertinoButton(
                      onPressed: () => onTap(key),
                      child: currentIndex == key
                          ? child.activeIcon
                          : child.inactiveIcon,
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavBarItem {
  const BottomNavBarItem({
    required Icon activeIcon,
    required Icon inactiveIcon,
    double size = 30,
  })  : _activeIcon = activeIcon,
        _inactiveIcon = inactiveIcon,
        _size = size;

  final Icon _activeIcon;
  final Icon _inactiveIcon;
  final double _size;

  Icon get activeIcon => Icon(_activeIcon.icon, size: _size);
  Icon get inactiveIcon => Icon(_inactiveIcon.icon, size: _size);
}
