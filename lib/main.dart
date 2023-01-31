import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/internal/di/locator.dart' as locator;

import 'internal/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  locator.setup();

  final themeMode = await AdaptiveTheme.getThemeMode();

  runApp(App(themeMode: themeMode));
}
