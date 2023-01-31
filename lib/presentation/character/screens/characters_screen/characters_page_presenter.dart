part of 'characters_page.dart';

class CharactersPagePresenter implements IPresenter {
  CharactersPagePresenter({
    required this.characterRepository,
  });

  final ICharacterRepository characterRepository;

  late BehaviorSubject<List<CharacterCard>> characterCardsController;
  late BehaviorSubject<Pagination<CharacterCard>> paginationController;
  late BehaviorSubject<IError> errorController;
  late BehaviorSubject<bool> loadingController;

  late StreamSubscription paginationSubscription;

  @override
  void init() {
    characterCardsController = BehaviorSubject();
    paginationController = BehaviorSubject();
    errorController = BehaviorSubject();
    loadingController = BehaviorSubject();

    paginationSubscription = paginationController.listen((value) {
      final characterCards = characterCardsController.valueOrNull ?? [];
      characterCardsController.add([...characterCards, ...value.results]);
    });

    getCharacters();
  }

  void getCharacters() async {
    if (loadingController.valueOrNull == true) return;
    loadingController.add(true);
    final either = await characterRepository.getCharacters(
      page: paginationController.valueOrNull?.info.nextPage,
    );
    if (either.isRight()) {
      final right = either.asRight();
      paginationController.add(right);
    } else {
      final left = either.asLeft();
      errorController.add(left);
    }
    loadingController.add(false);
  }

  @override
  void dispose() {
    characterCardsController.close();
    paginationController.close();
    errorController.close();
    loadingController.close();

    paginationSubscription.cancel();
  }
}
