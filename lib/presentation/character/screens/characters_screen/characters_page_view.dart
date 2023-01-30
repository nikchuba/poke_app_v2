part of 'characters_page.dart';

class CharactersPageView extends StatefulWidget {
  const CharactersPageView({super.key});

  @override
  State<CharactersPageView> createState() => _CharactersPageViewState();
}

class _CharactersPageViewState extends State<CharactersPageView> {
  final repository = CharacterRepository(
    service: CharacterService(
      dio.Dio(
        dio.BaseOptions(baseUrl: ApiUrl.domain + ApiUrl.restApiPath),
      ),
    ),
  );

  late final BehaviorSubject<Response<CharacterCard>> characters;

  @override
  void initState() {
    characters = BehaviorSubject();
    repository.getCharacters().then((value) => characters.add(
          value.getOrElse(
            () => Response(info: ResponseInfo(count: 0, pages: 0), results: []),
          ),
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CHARACTERS'),
      ),
      body: StreamBuilder(
          stream: characters,
          builder: (context, snap) {
            final data = snap.data;
            final cards = data?.results;
            if (data == null) return const SizedBox();
            return ListView.builder(
              itemCount: cards!.length,
              itemBuilder: (context, index) {
                final card = cards[index];
                return Container(
                  padding: EdgeInsets.all(16),
                  height: 100,
                  decoration: BoxDecoration(),
                  // color: Theme.of(context).colorScheme,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(card.name),
                      Image.network(card.image),
                    ],
                  ),
                );
              },
            );
          }),
    );
  }
}
