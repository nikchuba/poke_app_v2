part of 'characters_screen.dart';

class CharactersScreenView extends StatefulWidget {
  const CharactersScreenView({super.key});

  @override
  State<CharactersScreenView> createState() => _CharactersScreenViewState();
}

class _CharactersScreenViewState extends State<CharactersScreenView>
    with TickerProviderStateMixin {
  CharactersScreenPresenter get presenter => context.read();
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
              SliverPadding(
                padding: kContentPadding,
                sliver: StreamBuilder(
                  initialData: const <CharacterCard>[],
                  stream: presenter.characterCards,
                  builder: (context, snapshot) {
                    final cards = snapshot.data!;
                    return SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        mainAxisExtent: 210,
                      ),
                      itemBuilder: (context, index) {
                        final card = cards.elementAt(index);
                        return CharacterCardWidget(
                          key: ValueKey(card.id),
                          card: card,
                        );
                      },
                      itemCount: cards.length,
                    );
                  },
                ),
              ),
            ],
          ),
          LoadingIndicator(
            isLoading: locator.get<CharacterManager>().isLoading,
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
