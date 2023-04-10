import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/navigation/app_router.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late final TextEditingController searchController;
  late final FocusNode searchFocus;
  late final AnimationController controller;
  late final Animation animation;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: GestureDetector(
        onTap: () {
          context.pushRoute(SearchRoute(context: context));
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          padding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withOpacity(.7),
            borderRadius: BorderRadius.circular(100),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Row(
              children: const [
                Icon(Icons.search_rounded),
                Text('Search'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
