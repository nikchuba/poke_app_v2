import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/error/error.dart';
import 'package:rick_and_morty/domain/entities/episode.dart';
import 'package:rick_and_morty/domain/entities/pagination.dart';
import 'package:rick_and_morty/domain/repositories/episode_repository.dart';
import 'package:rick_and_morty/internal/di/locator.dart';
import 'package:rick_and_morty/libraries/extensions/either.dart';
import 'package:rick_and_morty/libraries/ui/blurred_sliver_app_bar.dart';
import 'package:rick_and_morty/libraries/ui/layout/page.dart';
import 'package:rick_and_morty/libraries/ui/layout/presenter.dart';
import 'package:rick_and_morty/libraries/ui/widgets/loading_indicator.dart';
import 'package:rick_and_morty/navigation/app_router.dart';
import 'package:rxdart/rxdart.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';

part 'seasons_screen_presenter.dart';
part 'seasons_screen_view.dart';

class SeasonsScreen extends IScreen<SeasonsScreenPresenter, SeasonsScreenView> {
  SeasonsScreen({super.key})
      : super(
          presenter: SeasonsScreenPresenter(
            repository: locator.get(),
          )..init(),
          view: const SeasonsScreenView(),
        );
}
