import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/domain/entities/character_card.dart';
import 'package:rick_and_morty/internal/di/locator.dart';
import 'package:rick_and_morty/libraries/ui/blurred_sliver_app_bar.dart';
import 'package:rick_and_morty/libraries/ui/layout/page.dart';
import 'package:rick_and_morty/libraries/ui/layout/presenter.dart';
import 'package:rick_and_morty/libraries/ui/variables.dart';
import 'package:rick_and_morty/libraries/ui/widgets/loading_indicator.dart';
import 'package:rick_and_morty/managers/character_manager.dart';
import 'package:rxdart/rxdart.dart';

import 'widgets/character_card_widget.dart';

part 'characters_screen_presenter.dart';
part 'characters_screen_view.dart';

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
