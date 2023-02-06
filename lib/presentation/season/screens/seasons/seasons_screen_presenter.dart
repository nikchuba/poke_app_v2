part of 'seasons_screen.dart';

class SeasonsScreenPresenter implements IPresenter {
  SeasonsScreenPresenter({
    required IEpisodeRepository repository,
  }) : _repository = repository;

  final IEpisodeRepository _repository;

  late int season;
  late List<BehaviorSubject<List<Episode>>> seasonsController;
  late BehaviorSubject<Pagination<Episode>> paginationController;
  late BehaviorSubject<IError?> errorController;
  late BehaviorSubject<bool> loadingController;

  late StreamSubscription paginationSubscription;
  late StreamSubscription errorSubscription;
  late StreamSubscription connectionSubscription;

  @override
  void init() {
    seasonsController = List.generate(5, (index) => BehaviorSubject());
    paginationController = BehaviorSubject();
    errorController = BehaviorSubject();
    loadingController = BehaviorSubject();

    paginationSubscription = paginationController.listen((value) {
      seasonsController[season].add(value.results);
    });

    errorSubscription = errorController.listen((value) async {
      if (value is NetworkError) {
        connectionSubscription =
            InternetConnectionChecker().onStatusChange.listen((connection) {
          if (connection == InternetConnectionStatus.connected) {
            errorController.add(null);
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
      paginationController.add(right);
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
    paginationController.close();
    errorController.close();
    loadingController.close();

    paginationSubscription.cancel();
    connectionSubscription.cancel();
  }
}
