part of 'locations_screen.dart';

class LocationsScreenView extends StatefulWidget {
  const LocationsScreenView({super.key});

  @override
  State<LocationsScreenView> createState() => _LocationsScreenViewState();
}

class _LocationsScreenViewState extends State<LocationsScreenView>
    with TickerProviderStateMixin {
  LocationsScreenPresenter get presenter => context.read();
  ColorScheme get colorScheme => Theme.of(context).colorScheme;
  TextTheme get textTheme => Theme.of(context).textTheme;
  late final ScrollController controller;

  @override
  void initState() {
    presenter.getLocations();
    controller = ScrollController()..addListener(_lazyLoad);
    super.initState();
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
              const BlurredSliverAppBar(title: 'Locations'),
              SliverToBoxAdapter(
                child: Padding(
                  padding: kContentPadding,
                  child: StreamBuilder(
                    initialData: const <Location>{},
                    stream: presenter.locationsController,
                    builder: (context, snapshot) {
                      final locations = snapshot.data!;
                      return LocationsGridView(locations: locations);
                    },
                  ),
                ),
              ),
            ],
          ),
          LoadingIndicator(
            isLoading: presenter.loadingController,
          )
        ],
      ),
    );
  }

  void _lazyLoad() {
    final scrollDirection = controller.position.userScrollDirection;
    final pos = controller.position;
    final indicator = pos.maxScrollExtent - pos.pixels;
    if (indicator < 100 && scrollDirection == ScrollDirection.reverse) {
      presenter.getLocations();
    }
  }
}
