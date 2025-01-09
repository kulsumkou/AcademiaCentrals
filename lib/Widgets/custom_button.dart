import 'package:academia_centrals/MyTheme/theme_extension.dart';
import 'package:flutter/material.dart';
import '../../AppColors/app_colors.dart';
import 'app_text.dart';

class CustomButton extends StatelessWidget {
  final double? height, width, borderRadius, fontSize;
  final Color? backgroundColor, textColor, borderColor;
  final String? label;
  final FontWeight? fontWeight;
  final void Function()? onTap;
  final EdgeInsetsGeometry? margin;

  const CustomButton({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
    this.backgroundColor,
    this.label,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.onTap,
    this.borderColor,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        height: height ?? Size.height * .055,
        width: width ?? Size.width * 1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 30),
          color: backgroundColor ?? AppColors.primaryColor,
          border:
              Border.all(color: borderColor ?? Colors.transparent, width: 2),
        ),
        child: Center(
          child: AppText(
            text: label ?? "",
            textColor: textColor ?? context.customTheme.textColor,
            fontWeight: fontWeight ?? FontWeight.w500,
            fontSize: fontSize ?? 16,
          ),
        ),
      ),
    );
  }
}
