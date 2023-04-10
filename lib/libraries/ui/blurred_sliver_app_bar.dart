import 'dart:ui';
import 'dart:math' as math;

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class BlurredSliverAppBar extends StatelessWidget {
  const BlurredSliverAppBar({
    super.key,
    required this.title,
    this.bottom,
  });

  final String title;
  final PreferredSize? bottom;

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

const _toolbarHeight = 64.0;
const _expandedToolbarHeight = 150.0;
const _minTitleFontSize = 24.0;
const _maxTitleFontSize = 36.0;
const _minTitlePadding = 16.0;
const _maxTitlePadding = 48.0;
const _betweenPadding = 6.0;
const _maxBlur = 48.0;
const _minBlur = 0.0;

class _FloatingSegmentedControl<T extends Object>
    extends SliverPersistentHeaderDelegate {
  _FloatingSegmentedControl({
    required this.title,
    required this.context,
    this.bottom,
    // this.bottomHeight,
  })  : _minHeaderExtent = _toolbarHeight +
            _betweenPadding +
            (bottom != null
                ? (bottom.preferredSize.height + _betweenPadding)
                : 0) +
            MediaQuery.of(context).padding.top,
        _maxHeaderExtent = _expandedToolbarHeight +
            (bottom != null
                ? (bottom.preferredSize.height + _betweenPadding)
                : 0) +
            MediaQuery.of(context).padding.top;

  final String title;
  final BuildContext context;
  final PreferredSize? bottom;
  final double _minHeaderExtent;
  final double _maxHeaderExtent;

  static const RoundedRectangleBorder _shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)));

  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    final bool isLightTheme = AdaptiveTheme.of(context).mode.isLight;
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final background = colors.surface;
    final surfaceTint = colors.surfaceTint;

    final progress = shrinkOffset / maxExtent;
    final currentTitleSize = (_maxTitleFontSize * (1 - getCoeff(1) * progress))
        .clamp(_minTitleFontSize, _maxTitleFontSize);
    final currentBlur = (_maxBlur * progress).clamp(_minBlur, _maxBlur);
    final currentLeftTitlePadding =
        (_maxTitlePadding * (getCoeff(1.3) * math.pow(progress, .3)))
            .clamp(_minTitlePadding, _maxTitlePadding);
    final currentBottomSize =
        (1 * (1 - getCoeff(1) * progress)).clamp(0.85, 1.0);

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.hardEdge,
              width: double.infinity,
              decoration: BoxDecoration(
                color: background.withOpacity(0.5),
                borderRadius: _shape.borderRadius,
                boxShadow: [
                  BoxShadow(
                    color: surfaceTint.withOpacity(
                      (isLightTheme ? .24 : .08) * progress,
                    ),
                    blurRadius: 8,
                  )
                ],
              ),
              alignment: Alignment.bottomLeft,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: currentBlur,
                  sigmaY: currentBlur,
                ),
                child: Container(
                  height: _toolbarHeight,
                  padding: EdgeInsets.only(left: currentLeftTitlePadding),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: textTheme.headlineLarge?.copyWith(
                        fontSize: currentTitleSize, color: surfaceTint),
                  ),
                ),
              ),
            ),
          ),
          if (bottom != null) const SizedBox(height: _betweenPadding),
          if (bottom != null)
            Transform.scale(
              scale: currentBottomSize,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: bottom!.preferredSize.height,
                  width: bottom!.preferredSize.width,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: background.withOpacity(.7),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: surfaceTint.withOpacity(
                          isLightTheme ? .24 : .08,
                        ),
                        blurRadius: 8,
                      )
                    ],
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 32, sigmaY: 32),
                    child: bottom,
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
