import 'package:academia_centrals/MyTheme/theme_extension.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();
  return base
      .copyWith(scaffoldBackgroundColor: Colors.grey.shade50, extensions: [
    CustomThemeExtension.darkMode,
  ]);
}
