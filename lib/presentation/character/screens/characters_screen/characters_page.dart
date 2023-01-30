import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/error/error.dart';
import 'package:rick_and_morty/data/api_url.dart';
import 'package:rick_and_morty/data/data_sources/remote/rest_api/character_service.dart';
import 'package:rick_and_morty/data/repositories/character_repository.dart';
import 'package:rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/domain/entities/character_card.dart';
import 'package:rick_and_morty/domain/entities/response.dart';
import 'package:rick_and_morty/domain/entities/response_info.dart';
import 'package:rick_and_morty/libraries/ui/layout/page.dart';
import 'package:rick_and_morty/libraries/ui/layout/presenter.dart';
import 'package:rxdart/rxdart.dart';

part 'characters_page_presenter.dart';
part 'characters_page_view.dart';

class CharactersPage
    extends IScreen<CharactersPagePresenter, CharactersPageView> {
  CharactersPage({super.key})
      : super(
          presenter: CharactersPagePresenter(),
          view: const CharactersPageView(),
        );
}
