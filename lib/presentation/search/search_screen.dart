import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/libraries/ui/abstracts/popup.dart';

import 'search_screen_presenter.dart';
import 'search_screen_view.dart';

class SearchScreen extends HeroView {
  const SearchScreen({
    super.key,
    required super.context,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => SearchScreenPresenter(),
      dispose: (_, presenter) => presenter.dispose(),
      child: SearchScreenView(context: context),
    );
  }
}
