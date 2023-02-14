import 'dart:async';
import 'package:collection/collection.dart';

import 'package:rick_and_morty/core/error/error.dart';
import 'package:rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/domain/entities/character_card.dart';
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

  final _characterCards = BehaviorSubject<List<CharacterCard>>.seeded([]);
  final _characters = <Character>{};
  final _character = BehaviorSubject<Character?>();
  final _pageInfo = BehaviorSubject<PaginationInfo>();
  final _isLoading = BehaviorSubject<bool>.seeded(false);
  final _error = BehaviorSubject<IError?>();

  BehaviorSubject<List<CharacterCard>> get characterCards => _characterCards;
  BehaviorSubject<Character?> get character => _character;
  BehaviorSubject<PaginationInfo> get pageInfo => _pageInfo;
  BehaviorSubject<bool> get isLoading => _isLoading;

  late final StreamSubscription _connectionSubcription;

  void init() {
    _connectionSubcription =
        UniversalInternetChecker().onConnectionChange.listen((status) async {
      if (_error.valueOrNull is NetworkError &&
          status == ConnectionStatus.online) {}
    });
  }

  void dispose() {
    _characterCards.close();
    _pageInfo.close();
    _isLoading.close();
    _error.close();

    _connectionSubcription.cancel();
  }
}
