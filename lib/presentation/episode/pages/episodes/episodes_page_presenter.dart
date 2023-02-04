part of 'episodes_page.dart';

class EpisodesPagePresenter implements IPresenter {
  EpisodesPagePresenter({
    required IEpisodeRepository repository,
  }) : _repository = repository;

  final IEpisodeRepository _repository;

  late BehaviorSubject<List<Episode>> episodesController;
  late BehaviorSubject<Pagination<Episode>> paginationController;
  late BehaviorSubject<IError?> errorController;
  late BehaviorSubject<bool> loadingController;

  late StreamSubscription paginationSubscription;
  late StreamSubscription errorSubscription;
  late StreamSubscription connectionSubscription;

  @override
  void init() {
    episodesController = BehaviorSubject();
    paginationController = BehaviorSubject();
    errorController = BehaviorSubject();
    loadingController = BehaviorSubject();

    paginationSubscription = paginationController.listen((value) {
      episodesController.add(value.results);
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
    episodesController.close();
    paginationController.close();
    errorController.close();
    loadingController.close();

    paginationSubscription.cancel();
    connectionSubscription.cancel();
  }
}
