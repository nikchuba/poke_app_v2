import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/libraries/ui/internet_connection_snackbar.dart/internet_connection_snackbar.dart';
import 'package:rick_and_morty/libraries/ui/layout/page.dart';
import 'package:rick_and_morty/libraries/ui/layout/presenter.dart';
import 'package:rick_and_morty/navigation/app_router.dart';
import 'widgets/bottom_nav_bar/export.dart';

part 'home_screen_presenter.dart';
part 'home_screen_view.dart';

class HomeScreen extends IScreen<HomeScreenPresenter, HomeScreenView> {
  HomeScreen({super.key})
      : super(
          presenter: HomeScreenPresenter(),
          view: const HomeScreenView(),
        );
}
