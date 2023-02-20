import 'package:rick_and_morty/internal/di/locator.dart';
import 'package:rick_and_morty/libraries/ui/layout/page.dart';

import 'characters_screen_presenter.dart';
import 'characters_screen_view.dart';

class CharactersScreen
    extends IScreen<CharactersScreenPresenter, CharactersScreenView> {
  CharactersScreen({super.key})
      : super(
          presenter: CharactersScreenPresenter(
            characterManager: locator.get(),
          )..init(),
          view: const CharactersScreenView(),
        );
}
