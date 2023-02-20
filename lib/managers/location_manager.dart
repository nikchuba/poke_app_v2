import 'dart:async';

import 'package:rick_and_morty/core/error/error.dart';
import 'package:rick_and_morty/domain/entities/location.dart';
import 'package:rick_and_morty/domain/entities/pagination_info.dart';
import 'package:rick_and_morty/domain/repositories/location_repository.dart';
import 'package:rick_and_morty/libraries/extensions/either.dart';
import 'package:rxdart/rxdart.dart';
import 'package:universal_internet_checker/universal_internet_checker.dart';

class LocationManager {
  LocationManager({
    required ILocationRepository repository,
  }) : _repository = repository;

  final ILocationRepository _repository;

  final _locations = BehaviorSubject.seeded(<Location>{});
  final _pageInfo = BehaviorSubject<PaginationInfo>();
  final _isLoading = BehaviorSubject<bool>.seeded(false);
  final _error = BehaviorSubject<IError?>();

  BehaviorSubject<Set<Location>> get locations => _locations;
  BehaviorSubject<PaginationInfo> get pageInfo => _pageInfo;
  BehaviorSubject<bool> get isLoading => _isLoading;

  late final StreamSubscription _connectionSubcription;

  void updateLocations() async {
    if (_isLoading.value ||
        (_pageInfo.valueOrNull != null && _pageInfo.value.nextPage == null)) {
      return;
    }
    _isLoading.add(true);
    final either =
        await _repository.getLocations(_pageInfo.valueOrNull?.nextPage);
    if (either.isRight()) {
      final right = either.asRight();
      _pageInfo.add(right.info);
      _locations.add(
        {..._locations.valueOrNull ?? {}, ...right.results},
      );
      _error.add(null);
    } else {
      final left = either.asLeft();
      _error.add(left);
    }
    _isLoading.add(false);
  }

  void init() {
    _connectionSubcription =
        UniversalInternetChecker().onConnectionChange.listen((status) async {
      if (_error.valueOrNull is NetworkError &&
          status == ConnectionStatus.online) {}
    });
  }

  void dispose() {
    _locations.close();
    _pageInfo.close();
    _isLoading.close();
    _error.close();

    _connectionSubcription.cancel();
  }
}
