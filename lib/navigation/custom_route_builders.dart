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
        (page.child as HeroView).context.findRenderObject() as RenderBox?;
    if (box != null) {
      minSize = box.size;
      final startOffset = box.localToGlobal(Offset.zero);
      minCenter = minSize.center(startOffset);
    }

    final clientSize = MediaQuery.of(context).size;
    final maxCenter = clientSize.center(Offset.zero);
    final shortestClientSide = clientSize.shortestSide;
    final maxSize = Size(shortestClientSide, shortestClientSide * _popupRatio) *
        (shortestClientSide > 420 ? 0.75 : 0.9);

    minCenter ??= maxCenter;
    minSize ??= const Size(100, 100);

    return PageRouteBuilder(
      fullscreenDialog: true,
      opaque: false,
      maintainState: true,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(.4),
      settings: page,
      pageBuilder: (_, animation, ___) {
        tweenDouble() => Tween<double>(begin: 0, end: 1);
        final animationOpacity = tweenDouble().animate(
              CurvedAnimation(
                parent: animation,
                curve: const Interval(0, 0.6, curve: Curves.decelerate),
                // reverseCurve: const Interval(0, 0.5, curve: Curves.decelerate),
              ),
            ),
            animationRadius1 = tweenDouble().animate(
              CurvedAnimation(
                parent: animation,
                curve: const Interval(0, 0.6, curve: Curves.decelerate),
                // reverseCurve: const Interval(0, 0.5, curve: Curves.decelerate),
              ),
            ),
            animationRadius2 = tweenDouble().animate(
              CurvedAnimation(
                parent: animation,
                curve: const Interval(0.6, 1, curve: Curves.decelerate),
                // reverseCurve: const Interval(0.5, 1, curve: Curves.easeInQuint),
              ),
            ),
            animationCenter = tweenDouble().animate(
              CurvedAnimation(
                parent: animation,
                curve: const Interval(0.4, 1, curve: Curves.easeOutQuint),
              ),
            ),
            animationSize = tweenDouble().animate(
              CurvedAnimation(
                parent: animation,
                curve: const Interval(0.4, 1, curve: Curves.decelerate),
              ),
            );

        return AnimatedBuilder(
          animation: animation,
          builder: (context, _) {
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
            const maxRadius = 128;
            return BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 8 * animationRadius1.value,
                sigmaY: 8 * animationRadius1.value,
              ),
              child: Stack(
                children: [
                  Positioned.fromRect(
                    rect: Rect.fromCenter(
                      center: currentCenter,
                      width: currentWidth,
                      height: currentHeight,
                    ),
                    child: FadeTransition(
                      opacity: animationOpacity,
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            maxRadius *
                                (animationRadius1.value -
                                    animationRadius2.value),
                          ),
                        ),
                        child: child,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          // child: child,
        );
      },
    );
  }

  static Route<T> searchScreenBuilder<T>(
    BuildContext context,
    Widget child,
    CustomPage<T> page,
  ) {
    Offset? minCenter;
    Size? minSize;
    final box =
        (page.child as HeroView).context.findRenderObject() as RenderBox?;
    final startOffset = box?.localToGlobal(Offset.zero);
    minSize = box?.size;

    if (startOffset != null && minSize != null) {
      minCenter = startOffset.translate(minSize.width / 2, minSize.height / 2);
    }

    final clientSize = MediaQuery.of(context).size;
    final clientHeight = clientSize.height, clientWidth = clientSize.width;
    final maxCenter = Offset(clientWidth / 2, clientHeight / 2);
    final maxSize = clientSize;

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
          builder: (context, _) {
            // final currentWidth = minSize!.width +
            //     (maxSize.width - minSize.width) * animationSize.value;
            // final currentHeight = minSize.height +
            //     (maxSize.height - minSize.height) * animationSize.value;
            // final currentCenter = Offset(
            //   (minCenter!.dx +
            //       (maxCenter.dx - minCenter.dx) * animationCenter.value),
            //   (minCenter.dy +
            //       (maxCenter.dy - minCenter.dy) * animationCenter.value),
            // );
            return child;
          },
          // child: child,
        );
      },
    );
  }
}
