import 'dart:async';

import 'package:rick_and_morty/core/error/error.dart';
import 'package:rick_and_morty/domain/entities/episode.dart';
import 'package:rick_and_morty/domain/entities/pagination_info.dart';
import 'package:rick_and_morty/domain/repositories/episode_repository.dart';
import 'package:rick_and_morty/libraries/extensions/either.dart';
import 'package:rxdart/rxdart.dart';
import 'package:universal_internet_checker/universal_internet_checker.dart';

class EpisodeManager {
  EpisodeManager({
    required IEpisodeRepository repository,
  }) : _repository = repository;

  final IEpisodeRepository _repository;

  final List<BehaviorSubject<List<Episode>>> _seasons =
      List.generate(5, (index) => BehaviorSubject.seeded([]));
  final BehaviorSubject<int> _currentSeasonIndex = BehaviorSubject();
  final _pageInfo = BehaviorSubject<PaginationInfo>();
  final _isLoading = BehaviorSubject<bool>.seeded(false);
  final _error = BehaviorSubject<IError?>();

  List<BehaviorSubject<List<Episode>>> get seasons => _seasons;
  BehaviorSubject<PaginationInfo> get pageInfo => _pageInfo;
  BehaviorSubject<bool> get isLoading => _isLoading;

  late final StreamSubscription _connectionSubcription;
  late final StreamSubscription _seasonSubscription;

  BehaviorSubject<List<Episode>> currentSeason(int id) => _seasons[id - 1];

  void updateSeason(int id) async {
    _currentSeasonIndex.add(id - 1);
  }

  void _getEpisodesBySeason(int id) async {
    if (_isLoading.valueOrNull == true) return;
    _isLoading.add(true);
    final either = await _repository.getEpisodesBySeason(id);
    if (either.isRight()) {
      final right = either.asRight();
      _seasons[id - 1].add(right.results);
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

    _seasonSubscription = _currentSeasonIndex.listen((index) {
      final season = _seasons[index].value;
      if (season.isEmpty) _getEpisodesBySeason(index + 1);
    });
  }

  void dispose() {
    for (var season in _seasons) {
      season.close();
    }
    _pageInfo.close();
    _isLoading.close();
    _error.close();

    _connectionSubcription.cancel();
    _seasonSubscription.cancel();
  }
}
