import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/libraries/ui/layout/page.dart';
import 'package:rick_and_morty/libraries/ui/layout/presenter.dart';
import 'package:rick_and_morty/navigation/app_router.dart';
import 'widgets/bottom_nav_bar/export.dart';



part 'home_page_presenter.dart';
part 'home_page_view.dart';

class HomePage extends IScreen<HomePagePresenter, HomePageView> {
  HomePage({super.key})
      : super(
          presenter: HomePagePresenter(),
          view: const HomePageView(),
        );
}
