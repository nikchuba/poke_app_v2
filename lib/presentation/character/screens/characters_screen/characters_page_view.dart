part of 'characters_page.dart';

class CharactersPageView extends StatefulWidget {
  const CharactersPageView({super.key});

  @override
  State<CharactersPageView> createState() => _CharactersPageViewState();
}

class _CharactersPageViewState extends State<CharactersPageView> {
  late final ScrollController controller;
  final repository = CharacterRepository(
    service: CharacterService(
      dio.Dio(
        dio.BaseOptions(baseUrl: ApiUrl.domain + ApiUrl.restApiPath),
      ),
    ),
  );

  late final BehaviorSubject<Response<CharacterCard>> characters;
  late final BehaviorSubject<bool> loading;

  @override
  void initState() {
    controller = ScrollController();
    loading = BehaviorSubject();
    characters = BehaviorSubject();
    _getCharacters(0);

    controller.addListener(() async {
      final pos = controller.position;
      if (pos.pixels / pos.maxScrollExtent > 0.9 && loading.value == false) {
        final nextPage = characters.valueOrNull?.info.nextPage;
        if (nextPage != null) {
          _getCharacters(nextPage);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: controller,
        slivers: [
          SliverAppBar.large(
            title: const Text('CHARACTERS'),
            centerTitle: false,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: StreamBuilder(
              stream: characters,
              builder: (context, snapshot) {
                final cards = snapshot.data?.results;
                if (cards != null) {
                  return SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final card = cards[index];
                        return CharacterCardWidget(
                            key: ValueKey(card.id), card: card);
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
              stream: loading,
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
    );
  }

  Future<void> _getCharacters(int? page) async {
    loading.add(true);
    final response = await repository.getCharacters(page: page);
    final right = response.getOrElse(
      () => const Response(
        info: ResponseInfo(count: 0, pages: 0),
        results: [],
      ),
    );
    if (characters.hasValue) {
      characters.add(characters.value.copyWith(
          info: right.info,
          results: [...characters.value.results, ...right.results]));
    } else {
      characters.add(right);
    }
    loading.add(false);
  }
}
