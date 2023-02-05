import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/domain/entities/episode.dart';
import 'package:rick_and_morty/libraries/ui/layout/page.dart';
import 'package:rick_and_morty/libraries/ui/layout/presenter.dart';
import 'package:rick_and_morty/libraries/ui/variables.dart';
import 'package:rick_and_morty/presentation/episode/pages/episodes/seasons_page.dart';

part 'season_page_view.dart';

class SeasonPage extends IScreen<IPresenter, SeasonPageView> {
  SeasonPage({
    super.key,
    @pathParam required int id,
  }) : super(view: SeasonPageView(id: id));
}
