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
      appBar: AppBar(
        title: const Text('EPISODES'),
      ),
    );
  }
}
