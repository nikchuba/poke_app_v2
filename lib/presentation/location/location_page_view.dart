part of 'location_page.dart';

class LocationPageView extends StatefulWidget {
  const LocationPageView({super.key});

  @override
  State<LocationPageView> createState() => _LocationPageViewState();
}

class _LocationPageViewState extends State<LocationPageView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          BlurredSliverAppBar(title: 'Locations')
        ],
      ),
    );
  }
}
