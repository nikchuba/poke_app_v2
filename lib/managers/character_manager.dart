import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart' show IterableExtension;

import 'package:rick_and_morty/core/error/error.dart';
import 'package:rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/domain/entities/character_card.dart';
import 'package:rick_and_morty/domain/entities/pagination_info.dart';
import 'package:rick_and_morty/domain/repositories/character_repository.dart';
import 'package:rick_and_morty/libraries/extensions/either.dart';
import 'package:rxdart/rxdart.dart';
import 'package:universal_internet_checker/universal_internet_checker.dart';

class CharacterManager {
  CharacterManager({
    required ICharacterRepository repository,
  }) : _repository = repository;

  final ICharacterRepository _repository;

  final _characterCards = BehaviorSubject<Set<CharacterCard>>.seeded({});
  final _characters = <Character>{};
  final _currentCharacter = BehaviorSubject<Character?>();
  final _pageInfo = BehaviorSubject<PaginationInfo>();
  final _isLoading = BehaviorSubject<bool>.seeded(false);
  final _error = BehaviorSubject<IError?>();

  BehaviorSubject<Set<CharacterCard>> get characterCards => _characterCards;
  BehaviorSubject<Character?> get currentCharacter => _currentCharacter;
  BehaviorSubject<PaginationInfo> get pageInfo => _pageInfo;
  BehaviorSubject<bool> get isLoading => _isLoading;

  late final StreamSubscription _connectionSubcription;

  void updateCharacterCards() async {
    if (_isLoading.value ||
        (_pageInfo.valueOrNull != null && _pageInfo.value.nextPage == null)) {
      return;
    }
    _isLoading.add(true);
    final either = await _repository.getCharacters(
      page: _pageInfo.valueOrNull?.nextPage ?? 1,
    );
    if (either.isRight()) {
      final right = either.asRight();
      _pageInfo.add(right.info);
      _characterCards.add(
        {..._characterCards.valueOrNull ?? {}, ...right.results},
      );
      _error.add(null);
    } else {
      final left = either.asLeft();
      _error.add(left);
    }
    _isLoading.add(false);
  }

  void updateCharacter(int? id) {
    if (id == null) return _currentCharacter.add(null);
    final character = _characters.firstWhereOrNull((c) => c.id == id);
    if (character == null) {
      return _getCharacterById(id);
    }
    _currentCharacter.add(character);
  }

  void _getCharacterById(int id) async {
    final either = await _repository.getCharacterById(id);
    if (either.isRight()) {
      final right = either.asRight();
      _characters.add(right);
      _currentCharacter.add(right);
    } else {
      final left = either.asLeft();
      _error.add(left);
    }
  }

  void init() {
    _connectionSubcription =
        UniversalInternetChecker().onConnectionChange.listen((status) async {
      if ((characterCards.value.isEmpty ||
              _error.valueOrNull is NetworkError) &&
          status == ConnectionStatus.online) {
        updateCharacterCards();
      }
    });

    updateCharacterCards();
  }

  void dispose() {
    _characterCards.close();
    _pageInfo.close();
    _isLoading.close();
    _error.close();

    _connectionSubcription.cancel();
  }
}
