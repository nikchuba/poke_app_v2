part of 'characters_page.dart';

class CharactersPageView extends StatefulWidget {
  const CharactersPageView({super.key});

  @override
  State<CharactersPageView> createState() => _CharactersPageViewState();
}

class _CharactersPageViewState extends State<CharactersPageView>
    with TickerProviderStateMixin {
  CharactersPagePresenter get presenter => context.read();
  late final ScrollController controller;
  late final StreamSubscription errorSubscription;

  late AnimationController _errorAnimationController;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    controller = ScrollController()..addListener(_lazyLoad);
    errorSubscription = presenter.errorController.listen((value) {});

    _errorAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _sizeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _errorAnimationController,
        curve: Curves.easeOutBack,
        reverseCurve: Curves.easeOutBack,
      ),
    );
    _errorAnimationController.addListener(_errorAnimationListener);
    super.initState();
  }

  @override
  void dispose() {
    controller
      ..removeListener(_lazyLoad)
      ..dispose();
    errorSubscription.cancel();
    _errorAnimationController
      ..removeListener(_errorAnimationListener)
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
              SliverAppBar.large(
                title: const Text('CHARACTERS'),
                centerTitle: false,
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: StreamBuilder(
                  stream: presenter.characterCardsController,
                  builder: (context, snapshot) {
                    final cards = snapshot.data;
                    if (cards != null) {
                      return SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final card = cards[index];
                            return CharacterCardWidget(
                              key: ValueKey(card.id),
                              card: card,
                            );
                          },
                          childCount: cards.length,
                        ),
                      );
                    }
                    return const SliverToBoxAdapter(
                      child: SizedBox(),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: StreamBuilder(
                  initialData: false,
                  stream: presenter.loadingController,
                  builder: (context, snap) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Center(
                        child: snap.data == true
                            ? const CircularProgressIndicator()
                            : null,
                      ),
                    );
                  },
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 80 + 16),
              )
            ],
          ),
          StreamBuilder(
            stream: presenter.errorController,
            builder: (context, snapshot) {
              final message = snapshot.data?.message;
              if (message != null) {
                if (_errorAnimationController.status ==
                    AnimationStatus.dismissed) {
                  _errorAnimationController.forward();
                }

                return Positioned(
                  bottom: 80 + 32,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: ScaleTransition(
                      scale: _sizeAnimation,
                      alignment: Alignment.center,
                      child: IntrinsicWidth(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.errorContainer,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            message,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onErrorContainer),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }

  void _errorAnimationListener() async {
    if (_errorAnimationController.status == AnimationStatus.completed) {
      await Future.delayed(const Duration(milliseconds: 3000));
      _errorAnimationController.reverse();
    }
  }

  void _lazyLoad() {
    final scrollDirection = controller.position.userScrollDirection;
    final pos = controller.position;
    final indicator = pos.maxScrollExtent - pos.pixels;
    if (indicator < 100 && scrollDirection == ScrollDirection.reverse) {
      presenter.getCharacters();
    }
  }
}
