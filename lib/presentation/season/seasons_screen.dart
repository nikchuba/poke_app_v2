import 'package:rick_and_morty/internal/di/locator.dart';
import 'package:rick_and_morty/libraries/ui/layout/page.dart';

import 'seasons_screen_presenter.dart';
import 'seasons_screen_view.dart';

class SeasonsScreen extends IScreen<SeasonsScreenPresenter, SeasonsScreenView> {
  SeasonsScreen({super.key})
      : super(
          presenter: SeasonsScreenPresenter(
            manager: locator.get(),
          )..init(),
          view: const SeasonsScreenView(),
        );
}
