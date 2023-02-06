part of 'characters_screen.dart';

class CharactersScreenPresenter implements IPresenter {
  CharactersScreenPresenter({
    required ICharacterRepository repository,
  }) : _repository = repository;

  final ICharacterRepository _repository;

  late BehaviorSubject<List<CharacterCard>> characterCardsController;
  late BehaviorSubject<Pagination<CharacterCard>> paginationController;
  late BehaviorSubject<IError?> errorController;
  late BehaviorSubject<bool> loadingController;

  late StreamSubscription paginationSubscription;
  late StreamSubscription errorSubscription;
  late StreamSubscription connectionSubscription;

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

    errorSubscription = errorController.listen((value) async {
      if (value is NetworkError) {
        connectionSubscription =
            InternetConnectionChecker().onStatusChange.listen((connection) {
          if (connection == InternetConnectionStatus.connected) {
            errorController.add(null);
            getCharacters();
          }
        });
      }
    });
  }

  void getCharacters() async {
    if (loadingController.valueOrNull == true) return;
    loadingController.add(true);
    final either = await _repository.getCharacters(
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
    connectionSubscription.cancel();
  }
}
