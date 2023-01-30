import 'dart:ui';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottom_nav_bar_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {super.key,
      required this.currentIndex,
      required this.onTap,
      required this.items});

  final int currentIndex;
  final Function(int) onTap;
  final List<BottomNavBarItem> items;

  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).colorScheme.surface;
    final shadowColor = Theme.of(context).colorScheme.surfaceTint;
    final bool isLightTheme = AdaptiveTheme.of(context).mode.isLight;

    return Container(
      margin: const EdgeInsets.only(left: 32, right: 32, bottom: 16),
      constraints: const BoxConstraints(
        maxHeight: 80,
        maxWidth: 400,
        minWidth: 280,
      ),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: background.withOpacity(0.7),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(isLightTheme ? .24 : .08),
              blurRadius: 8,
            )
          ]),
      child: Stack(
        children: [
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: items.asMap().entries.map((entry) {
                final key = entry.key;
                final child = entry.value;
                return currentIndex == key
                    ? child.activeIcon
                    : child.inactiveIcon;
              }).toList(),
            ),
          ),
          Center(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 20, sigmaY: 20, tileMode: TileMode.mirror),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: items.asMap().entries.map((entry) {
                  final key = entry.key;
                  final child = entry.value;
                  return CupertinoButton(
                    onPressed: currentIndex != key ? () => onTap(key) : null,
                    child: currentIndex == key
                        ? child.activeIcon
                        : child.inactiveIcon,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
