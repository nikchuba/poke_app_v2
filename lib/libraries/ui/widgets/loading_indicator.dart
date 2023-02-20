import 'dart:ui';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

const _wrapperSize = 80.0;

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, this.isLoading});

  final Stream<bool>? isLoading;

  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).colorScheme.surface;
    final shadowColor = Theme.of(context).colorScheme.surfaceTint;
    final bool isLightTheme = AdaptiveTheme.of(context).mode.isLight;

    return StreamBuilder<bool>(
        initialData: false,
        stream: isLoading,
        builder: (context, snap) {
          return Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              switchInCurve: Curves.ease,
              switchOutCurve: Curves.ease,
              transitionBuilder: (child, animation) {
                return AnimatedBuilder(
                    animation: animation,
                    builder: (context, _) {
                      final progress = animation.value;
                      final blur = 20 * progress;
                      final size = _wrapperSize * progress;
                      return Container(
                        clipBehavior: Clip.hardEdge,
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                            color: background.withOpacity(.7 * progress),
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: shadowColor
                                    .withOpacity(isLightTheme ? .24 : .08),
                                blurRadius: 8,
                              )
                            ]),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: blur,
                              sigmaY: blur,
                              tileMode: TileMode.mirror),
                          child: Transform.scale(
                            scale: (1.0 * progress),
                            child: child,
                          ),
                        ),
                      );
                    });
              },
              child: snap.data == true
                  ? const Center(
                      child: CircularProgressIndicator(
                      strokeWidth: 4,
                    ))
                  : null,
            ),
          );
        });
  }
}
