import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/error/error.dart';
import 'package:rick_and_morty/domain/entities/character_card.dart';
import 'package:rick_and_morty/domain/entities/pagination.dart';
import 'package:rick_and_morty/domain/repositories/character_repository.dart';
import 'package:rick_and_morty/internal/di/locator.dart';
import 'package:rick_and_morty/libraries/extensions/either.dart';
import 'package:rick_and_morty/libraries/ui/layout/page.dart';
import 'package:rick_and_morty/libraries/ui/layout/presenter.dart';
import 'package:rick_and_morty/presentation/character/screens/characters_screen/widgets/character_card_widget.dart';
import 'package:rxdart/rxdart.dart';

part 'characters_page_presenter.dart';
part 'characters_page_view.dart';

class CharactersPage
    extends IScreen<CharactersPagePresenter, CharactersPageView> {
  CharactersPage({super.key})
      : super(
          presenter: CharactersPagePresenter(
            repository: locator.get(),
          )..init(),
          view: const CharactersPageView(),
        );
}
