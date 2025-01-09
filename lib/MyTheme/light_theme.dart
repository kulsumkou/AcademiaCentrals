import 'package:flutter/material.dart';

import 'theme_extension.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(scaffoldBackgroundColor: Colors.white, extensions: [
    CustomThemeExtension.lightMode,
  ]);
}
