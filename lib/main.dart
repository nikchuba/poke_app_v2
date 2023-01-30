import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import 'internal/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeMode = await AdaptiveTheme.getThemeMode();

  runApp(App(themeMode: themeMode));
}
