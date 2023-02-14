part of 'seasons_screen.dart';

class SeasonsScreenPresenter implements IPresenter {
  SeasonsScreenPresenter({
    required IEpisodeRepository repository,
  }) : _repository = repository;

  final IEpisodeRepository _repository;

  late int season;
  late List<BehaviorSubject<List<Episode>>> seasonsController;
  late BehaviorSubject<IError?> errorController;
  late BehaviorSubject<bool> loadingController;

  late StreamSubscription paginationSubscription;
  late StreamSubscription errorSubscription;
  late StreamSubscription? connectionSubscription;

  @override
  void init() {
    seasonsController = List.generate(5, (index) => BehaviorSubject());
    errorController = BehaviorSubject();
    loadingController = BehaviorSubject();

    errorSubscription = errorController.listen((value) async {
      if (value is NetworkError) {
        connectionSubscription =
            UniversalInternetChecker().onConnectionChange.listen((status) {
          if (status == ConnectionStatus.online) {
            errorController.add(null);
            getEpisodesBySeason(season + 1);
            connectionSubscription!.cancel();
            connectionSubscription = null;
          }
        });
      }
    });
  }

  void getEpisodesBySeason(int season) async {
    if (loadingController.valueOrNull == true) return;
    loadingController.add(true);
    final either = await _repository.getEpisodesBySeason(season);
    if (either.isRight()) {
      final right = either.asRight();
      seasonsController[season - 1].add([...right.results]);
    } else {
      final left = either.asLeft();
      errorController.add(left);
    }
    loadingController.add(false);
  }

  @override
  void dispose() {
    for (var element in seasonsController) {
      element.close();
    }
    errorController.close();
    loadingController.close();

    paginationSubscription.cancel();
    connectionSubscription?.cancel();
    errorSubscription.cancel();
    connectionSubscription = null;
  }
}
