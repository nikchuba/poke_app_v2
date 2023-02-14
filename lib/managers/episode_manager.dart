import 'dart:async';
import 'package:collection/collection.dart';

import 'package:rick_and_morty/core/error/error.dart';
import 'package:rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/domain/entities/character_card.dart';
import 'package:rick_and_morty/domain/entities/episode.dart';
import 'package:rick_and_morty/domain/entities/pagination_info.dart';
import 'package:rick_and_morty/domain/repositories/episode_repository.dart';
import 'package:rick_and_morty/libraries/extensions/either.dart';
import 'package:rick_and_morty/managers/character_manager.dart';
import 'package:rxdart/rxdart.dart';
import 'package:universal_internet_checker/universal_internet_checker.dart';

class EpisodeManager {
  EpisodeManager({
    required CharacterManager characterManager,
    required IEpisodeRepository repository,
  })  : _characterManager = characterManager,
        _repository = repository;

  final CharacterManager _characterManager;
  final IEpisodeRepository _repository;

  final List<BehaviorSubject<List<Episode>>> _seasons =
      List.generate(5, (index) => BehaviorSubject.seeded([]));
  final BehaviorSubject<List<Episode>> _season = BehaviorSubject();
  final _pageInfo = BehaviorSubject<PaginationInfo>();
  final _isLoading = BehaviorSubject<bool>.seeded(false);
  final _error = BehaviorSubject<IError?>();

  BehaviorSubject<List<Episode>> get season => _season;
  BehaviorSubject<PaginationInfo> get pageInfo => _pageInfo;
  BehaviorSubject<bool> get isLoading => _isLoading;

  late final StreamSubscription _connectionSubcription;

  void updateSeason(int seasonId) async {
    final season = _seasons[seasonId - 1].value;
    if (season.isNotEmpty) {
      return _season.add(season);
    }
    _getEpisodesBySeason(seasonId);
  }

  void _getEpisodesBySeason(int seasonId) async {
    if (_isLoading.valueOrNull == true) return;
    _isLoading.add(true);
    final either = await _repository.getEpisodesBySeason(seasonId);
    if (either.isRight()) {
      final right = either.asRight();
      _season.add(right.results);
      _seasons[seasonId - 1].add(right.results);
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
    for (var season in _seasons) {
      season.close();
    }
    _pageInfo.close();
    _isLoading.close();
    _error.close();

    _connectionSubcription.cancel();
  }
}
