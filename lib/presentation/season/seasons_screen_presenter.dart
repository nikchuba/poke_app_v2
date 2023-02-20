import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/core/error/error.dart';
import 'package:rick_and_morty/domain/entities/episode.dart';
import 'package:rick_and_morty/libraries/ui/layout/presenter.dart';
import 'package:rick_and_morty/managers/episode_manager.dart';
import 'package:rxdart/rxdart.dart';

class SeasonsScreenPresenter implements IPresenter {
  SeasonsScreenPresenter({
    required EpisodeManager manager,
  }) : _manager = manager;

  final EpisodeManager _manager;

  late final BehaviorSubject<bool> loadingController;
  BehaviorSubject<List<Episode>> currentSeason(int id) =>
      _manager.currentSeason(id);

  late final StreamSubscription _seasonSubscription;
  late final StreamSubscription _loadingSubscription;

  @override
  void init() {
    loadingController = BehaviorSubject();
    _loadingSubscription = _manager.isLoading.listen(loadingController.add);
  }

  void changeSeason(int id) {
    _manager.updateSeason(id);
  }

  @override
  void dispose() {
    loadingController.close();

    _seasonSubscription.cancel();
    _loadingSubscription.cancel();
  }
}
