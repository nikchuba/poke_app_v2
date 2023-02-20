import 'dart:async';

import 'package:rick_and_morty/domain/entities/character_card.dart';
import 'package:rick_and_morty/libraries/ui/layout/presenter.dart';
import 'package:rick_and_morty/managers/character_manager.dart';
import 'package:rxdart/rxdart.dart';

class CharactersScreenPresenter implements IPresenter {
  CharactersScreenPresenter({
    required CharacterManager characterManager,
  }) : _characterManager = characterManager;

  final CharacterManager _characterManager;

  late BehaviorSubject<Set<CharacterCard>> characterCards;
  late StreamSubscription _cardsSubscription;

  @override
  void init() {
    characterCards = BehaviorSubject.seeded(
      _characterManager.characterCards.value,
    );
    _cardsSubscription = _characterManager.characterCards.listen(
      characterCards.add,
    );

    loadCharacterCards();
  }

  void loadCharacterCards() async {
    _characterManager.updateCharacterCards();
  }

  @override
  void dispose() {
    characterCards.close();
    _cardsSubscription.cancel();
  }
}
