import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/libraries/ui/abstracts/popup.dart';

const _popupRatio = 1.25 / 1;

class CustomRouteBuilders {
  static Route<T> popupBuilder<T>(
    BuildContext context,
    Widget child,
    CustomPage<T> page,
  ) {
    Offset? minCenter;
    Size? minSize;
    final box =
        (page.child as PopupView).context?.findRenderObject() as RenderBox?;
    final startOffset = box?.localToGlobal(Offset.zero);
    minSize = box?.size;

    if (startOffset != null && minSize != null) {
      minCenter = startOffset.translate(minSize.width / 2, minSize.height / 2);
    }

    final clientSize = MediaQuery.of(context).size;
    final clientHeight = clientSize.height, clientWidth = clientSize.width;
    final maxCenter = Offset(clientWidth / 2, clientHeight / 2);
    final maxSize = clientWidth >= clientHeight
        ? Size(clientHeight * 0.75 / _popupRatio, clientHeight * 0.75)
        : clientWidth > 420
            ? Size(clientWidth * 0.75, clientWidth * 0.75 * _popupRatio)
            : Size(clientWidth * 0.9, clientWidth * 0.9 * _popupRatio);

    minCenter ??= Offset(clientWidth / 2, clientHeight / 2);
    minSize ??= const Size(100, 100);

    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 200),
      reverseTransitionDuration: const Duration(milliseconds: 150),
      fullscreenDialog: true,
      opaque: false,
      maintainState: true,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(.4),
      settings: page,
      pageBuilder: (_, animation, ___) {
        final animationCenter = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutQuint,
              ),
            ),
            animationSize = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.decelerate,
                // reverseCurve: Curves.easeIn
              ),
            );

        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            final currentWidth = minSize!.width +
                (maxSize.width - minSize.width) * animationSize.value;
            final currentHeight = minSize.height +
                (maxSize.height - minSize.height) * animationSize.value;
            final currentCenter = Offset(
              (minCenter!.dx +
                  (maxCenter.dx - minCenter.dx) * animationCenter.value),
              (minCenter.dy +
                  (maxCenter.dy - minCenter.dy) * animationCenter.value),
            );
            return BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20 * animationSize.value,
                sigmaY: 20 * animationSize.value,
              ),
              child: Stack(
                children: [
                  Positioned.fromRect(
                    rect: Rect.fromCenter(
                      center: currentCenter,
                      width: currentWidth,
                      height: currentHeight,
                    ),
                    child: child!,
                  ),
                ],
              ),
            );
          },
          child: child,
        );
      },
    );
  }
}
