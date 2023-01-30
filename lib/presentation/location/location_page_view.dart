part of 'location_page.dart';

class LocationPageView extends StatefulWidget {
  const LocationPageView({super.key});

  @override
  State<LocationPageView> createState() => _LocationPageViewState();
}

class _LocationPageViewState extends State<LocationPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: const Text('LOCATIONS'),
          ),
        ],
      ),
    );
  }
}
