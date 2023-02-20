part of 'locations_screen.dart';

class LocationsScreenPresenter implements IPresenter {
  LocationsScreenPresenter({
    required LocationManager manager,
  }) : _manager = manager;

  final LocationManager _manager;

  late final BehaviorSubject<Set<Location>> locationsController;
  late final BehaviorSubject<bool> loadingController;

  late final StreamSubscription _loadingSubscription;
  late final StreamSubscription _locationsSubscription;

  @override
  void init() {
    locationsController = BehaviorSubject.seeded(_manager.locations.value);
    loadingController = BehaviorSubject.seeded(_manager.isLoading.value);
    _loadingSubscription = _manager.isLoading.listen(loadingController.add);
    _locationsSubscription = _manager.locations.listen(locationsController.add);
  }

  void getLocations() async {
    _manager.updateLocations();
  }

  @override
  void dispose() {
    locationsController.close();
    _loadingSubscription.cancel();
    _locationsSubscription.cancel();
  }
}
