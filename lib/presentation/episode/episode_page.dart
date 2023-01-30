import 'package:flutter/material.dart';
import 'package:rick_and_morty/libraries/ui/layout/page.dart';
import 'package:rick_and_morty/libraries/ui/layout/presenter.dart';

part 'episode_page_presenter.dart';
part 'episode_page_view.dart';

class EpisodePage extends IScreen<EpisodePagePresenter, EpisodePageView> {
  EpisodePage({super.key})
      : super(
          presenter: EpisodePagePresenter(),
          view: const EpisodePageView(),
        );
}
