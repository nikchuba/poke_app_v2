import 'dart:async';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rick_and_morty/core/error/error.dart';
import 'package:rick_and_morty/domain/entities/episode.dart';
import 'package:rick_and_morty/domain/entities/pagination.dart';
import 'package:rick_and_morty/domain/repositories/episode_repository.dart';
import 'package:rick_and_morty/internal/di/locator.dart';
import 'package:rick_and_morty/libraries/extensions/either.dart';
import 'package:rick_and_morty/libraries/ui/blurred_sliver_app_bar.dart';
import 'package:rick_and_morty/libraries/ui/layout/page.dart';
import 'package:rick_and_morty/libraries/ui/layout/presenter.dart';
import 'package:rick_and_morty/navigation/app_router.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sliver_tools/sliver_tools.dart';

part 'episodes_page_presenter.dart';
part 'episodes_page_view.dart';

class EpisodesPage extends IScreen<EpisodesPagePresenter, EpisodesPageView> {
  EpisodesPage({super.key})
      : super(
          presenter: EpisodesPagePresenter(
            repository: locator.get(),
          )..init(),
          view: const EpisodesPageView(),
        );
}
