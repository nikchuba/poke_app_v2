import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlurredSliverAppBar extends StatelessWidget {
  const BlurredSliverAppBar({
    super.key,
    required this.title,
    this.bottom,
  });

  final String title;
  final CupertinoSlidingSegmentedControl? bottom;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _FloatingSegmentedControl(
        title: title,
        context: context,
        bottom: bottom,
      ),
    );
  }
}

const _maxTitleSize = 42.0;
const _minTitleSize = 24.0;
const _minTitlePadding = 16.0;
const _maxTitlePadding = 48.0;
const _maxBottomWidth = 240.0;
const _maxBlur = 20.0;

class _FloatingSegmentedControl<T extends Object>
    extends SliverPersistentHeaderDelegate {
  _FloatingSegmentedControl({
    required this.title,
    required this.context,
    this.bottom,
  })  : _minHeaderExtent =
            (bottom != null ? 122 : 64) + MediaQuery.of(context).padding.top,
        _maxHeaderExtent =
            (bottom != null ? 200 : 142) + MediaQuery.of(context).padding.top;

  final String title;
  final BuildContext context;
  final Widget? bottom;
  final double _minHeaderExtent;
  final double _maxHeaderExtent;

  static const RoundedRectangleBorder _shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)));

  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    Color background = colorScheme.surface;
    Color shadowColor = colorScheme.surfaceTint;

    final progress = shrinkOffset / maxExtent;
    final currentTitleSize = 
        (_maxTitleSize * (1 - getCoeff(1) * progress))
            .clamp(_minTitleSize, _maxTitleSize);
    final currentBlur = (_maxBlur * progress).clamp(0.0, _maxBlur);
    final currentLeftTitlePadding =
        (_maxTitlePadding * (getCoeff(1.3) * math.pow(progress, .3)))
            .clamp(_minTitlePadding, _maxTitlePadding);
    final currentBottomSize = (1 * (1 - getCoeff(1) * progress)).clamp(0.85, 1.0);

    return SizedBox(
      width: double.infinity,
      height: _maxHeaderExtent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsets.only(
              left: currentLeftTitlePadding,
              right: _minTitlePadding,
            ),
            width: double.infinity,
            height: 64 + MediaQuery.of(context).padding.top,
            decoration: BoxDecoration(
              color: background.withOpacity(0.7),
              borderRadius: _shape.borderRadius,
            ),
            alignment: Alignment.bottomLeft,
            child: BackdropFilter(
              filter:
                  ImageFilter.blur(sigmaX: currentBlur, sigmaY: currentBlur),
              child: SizedBox(
                height: 64,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: textTheme.headlineLarge?.copyWith(
                        fontSize: currentTitleSize, color: shadowColor),
                  ),
                ),
              ),
            ),
          ),
          if (bottom != null)
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Transform.scale(
                scale: currentBottomSize,
                child: Center(
                  child: Container(
                    width: _maxBottomWidth,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: background.withOpacity(.7),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor.withOpacity(.08),
                          blurStyle: BlurStyle.inner,
                          blurRadius: 8,
                        )
                      ],
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: bottom,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  double getCoeff(num value) {
    return value / (bottom == null ? 1 : 0.85);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate != this;

  @override
  double get maxExtent => _maxHeaderExtent;

  @override
  double get minExtent => _minHeaderExtent;
}
