import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/domain/entities/character_card.dart';
import 'package:rick_and_morty/internal/di/locator.dart';
import 'package:rick_and_morty/libraries/ui/blurred_sliver_app_bar.dart';
import 'package:rick_and_morty/libraries/ui/variables.dart';
import 'package:rick_and_morty/libraries/ui/widgets/loading_indicator.dart';
import 'package:rick_and_morty/managers/character_manager.dart';

import 'characters_screen_presenter.dart';
import 'widgets/character_card_widget.dart';

class CharactersScreenView extends StatefulWidget {
  const CharactersScreenView({super.key});

  @override
  State<CharactersScreenView> createState() => _CharactersScreenViewState();
}

class _CharactersScreenViewState extends State<CharactersScreenView>
    with TickerProviderStateMixin {
  CharactersScreenPresenter get presenter => context.read();
  MediaQueryData get mediaQuery => MediaQuery.of(context);
  ColorScheme get colorScheme => Theme.of(context).colorScheme;
  TextTheme get textTheme => Theme.of(context).textTheme;
  late final ScrollController controller;
  late EdgeInsets padding;

  @override
  void initState() {
    controller = ScrollController()..addListener(_lazyLoad);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final deviceWidth = mediaQuery.size.width;
    final horizontalPadding = max((deviceWidth - kMaxContentWidth) / 2, 16.0);
    padding = kContentPadding.copyWith(
      left: horizontalPadding,
      right: horizontalPadding,
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller
      ..removeListener(_lazyLoad)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: controller,
            slivers: [
              const BlurredSliverAppBar(title: 'Characters'),
              SliverPadding(
                padding: padding,
                sliver: StreamBuilder(
                  initialData: const <CharacterCard>[],
                  stream: presenter.characterCards,
                  builder: (context, snapshot) {
                    final cards = snapshot.data!;
                    return SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 240,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        mainAxisExtent: 200,
                      ),
                      itemBuilder: (context, index) {
                        final card = cards.elementAt(index);
                        return CharacterCardWidget(
                          key: ValueKey(card.id),
                          card: card,
                        );
                      },
                      itemCount: cards.length,
                    );
                  },
                ),
              ),
            ],
          ),
          LoadingIndicator(
            isLoading: locator.get<CharacterManager>().isLoading,
          ),
        ],
      ),
    );
  }

  void _lazyLoad() {
    final scrollDirection = controller.position.userScrollDirection;
    final pos = controller.position;
    final indicator = pos.maxScrollExtent - pos.pixels;
    if (indicator < 100 && scrollDirection == ScrollDirection.reverse) {
      presenter.loadCharacterCards();
    }
  }
}
