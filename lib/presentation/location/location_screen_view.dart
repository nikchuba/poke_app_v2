part of 'location_screen.dart';

class LocationScreenView extends StatefulWidget {
  const LocationScreenView({super.key});

  @override
  State<LocationScreenView> createState() => _LocationScreenViewState();
}

class _LocationScreenViewState extends State<LocationScreenView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [BlurredSliverAppBar(title: 'Locations')],
      ),
    );
  }
}
