part of 'characters_page.dart';

class CharactersPageView extends StatefulWidget {
  const CharactersPageView({super.key});

  @override
  State<CharactersPageView> createState() => _CharactersPageViewState();
}

class _CharactersPageViewState extends State<CharactersPageView>
    with TickerProviderStateMixin {
  CharactersPagePresenter get presenter => context.read();
  late final ScrollController controller;

  @override
  void initState() {
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
              SliverAppBar.large(
                title: const Text('CHARACTERS'),
                centerTitle: false,
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: StreamBuilder(
                  stream: presenter.characterCardsController,
                  builder: (context, snapshot) {
                    final cards = snapshot.data;
                    if (cards != null) {
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
                    }
                    return const SliverToBoxAdapter(
                      child: SizedBox(),
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
