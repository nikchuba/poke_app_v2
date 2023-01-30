part of 'episode_page.dart';

class EpisodePageView extends StatefulWidget {
  const EpisodePageView({super.key});

  @override
  State<EpisodePageView> createState() => _EpisodePageViewState();
}

class _EpisodePageViewState extends State<EpisodePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: const Text('EPISODES'),
          ),
        ],
      ),
    );
  }
}
