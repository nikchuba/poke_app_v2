part of 'characters_page.dart';

class CharactersPageView extends StatefulWidget {
  const CharactersPageView({super.key});

  @override
  State<CharactersPageView> createState() => _CharactersPageViewState();
}

class _CharactersPageViewState extends State<CharactersPageView>
    with TickerProviderStateMixin {
  CharactersPagePresenter get presenter => context.read();
  ColorScheme get colorScheme => Theme.of(context).colorScheme;
  TextTheme get textTheme => Theme.of(context).textTheme;
  late final ScrollController controller;

  @override
  void initState() {
    presenter.getCharacters();
    controller = ScrollController()..addListener(_lazyLoad);
    super.initState();
  }

  @override
  void dispose() {
    controller
      ..removeListener(_lazyLoad)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: controller,
            slivers: [
              const BlurredSliverAppBar(title: 'Characters'),
              SliverToBoxAdapter(
                child: Center(
                  child: PhotoHero(
                    icon: Icons.access_time_filled_outlined,
                    width: 300.0,
                    onTap: () {
                      // final route = router.currentChild;
                      context.navigateTo(CharacterCardDetailRoute());
                      // print(router);
                      // Navigator.of(context).push(MaterialPageRoute<void>(
                      //     fullscreenDialog: true,
                      //     allowSnapshotting: false,
                      //     builder: (BuildContext context) {
                      //       return CharacterCardDetailPage();
                      //     }));
                    },
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: StreamBuilder(
                  initialData: const <CharacterCard>[],
                  stream: presenter.characterCardsController,
                  builder: (context, snapshot) {
                    final cards = snapshot.data!;
                    return SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        mainAxisExtent: 210,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final card = cards[index];
                          return CharacterCardWidget(
                            key: ValueKey(card.id),
                            card: card,
                          );
                        },
                        childCount: cards.length,
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: StreamBuilder(
                  initialData: false,
                  stream: presenter.loadingController,
                  builder: (context, snap) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Center(
                        child: snap.data == true
                            ? const CircularProgressIndicator()
                            : null,
                      ),
                    );
                  },
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 80 + 16),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _lazyLoad() {
    final scrollDirection = controller.position.userScrollDirection;
    final pos = controller.position;
    final indicator = pos.maxScrollExtent - pos.pixels;
    if (indicator < 100 && scrollDirection == ScrollDirection.reverse) {
      presenter.getCharacters();
    }
  }
}

class PhotoHero extends StatelessWidget {
  const PhotoHero(
      {Key? key, required this.icon, required this.onTap, required this.width})
      : super(key: key);

  final IconData icon;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: icon,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Icon(
              icon,
              // fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
