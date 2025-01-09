import 'package:flutter/material.dart';

import '../AppColors/app_colors.dart';



extension ExtendedTheme on BuildContext {
  CustomThemeExtension get customTheme {
    return Theme.of(this).extension<CustomThemeExtension>()!;
  }
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  static const lightMode = CustomThemeExtension(
    iconColor:Colors.black,
    bgcolor: Colors.white,
    textColor: Colors.black,
    cardColor:Colors.white38,
  );
  static const darkMode = CustomThemeExtension(
    iconColor: AppColors.whiteColor,
    bgcolor: AppColors.bgColor,
    textColor: AppColors.whiteColor,
    cardColor:AppColors.cardColor,

  );
  final Color? bgcolor;
  final Color? textColor;
  final Color? iconColor;
  final Color? cardColor;


  const CustomThemeExtension({
    this.bgcolor,
    this.textColor,
    this.iconColor,
    this.cardColor,

  });
  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    final Color? bgcolor,
    final Color? textColor,
    final Color? iconColor,
    final Color? cardColor,

  }) {
    return CustomThemeExtension(
      bgcolor: bgcolor ?? this.bgcolor,
      textColor: textColor ?? this.textColor,
      iconColor: iconColor ?? this.iconColor,
      cardColor: cardColor ?? this.cardColor,

    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
      covariant ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
      bgcolor: Color.lerp(bgcolor, other.bgcolor, t),
      textColor: Color.lerp(textColor, other.textColor, t),
      iconColor: Color.lerp(iconColor, other.iconColor, t),
      cardColor: Color.lerp(cardColor, other.cardColor, t),

    );
  }
}
