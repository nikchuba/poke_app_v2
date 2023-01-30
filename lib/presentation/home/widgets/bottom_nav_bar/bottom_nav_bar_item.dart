import 'package:flutter/material.dart';

class BottomNavBarItem {
  const BottomNavBarItem({
    required Icon activeIcon,
    required Icon inactiveIcon,
    required Color color,
    double size = 30,
  })  : _activeIcon = activeIcon,
        _inactiveIcon = inactiveIcon,
        _color = color,
        _size = size;

  final Icon _activeIcon;
  final Icon _inactiveIcon;
  final Color _color;
  final double _size;

  Icon get activeIcon => Icon(
        _activeIcon.icon,
        size: _size,
        color: _color,
      );
  Icon get inactiveIcon => Icon(
        _inactiveIcon.icon,
        size: _size,
        color: _color,
      );
}
