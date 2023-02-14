part of 'characters_screen.dart';

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
      _characterManager.characterCards.valueOrNull ?? {},
    );
    _cardsSubscription = _characterManager.characterCards.listen(
      characterCards.add,
    );
  }

  void getCharacters() async {
    _characterManager.updateCharacterCards();
  }

  @override
  void dispose() {
    characterCards.close();
    _cardsSubscription.cancel();
  }
}
