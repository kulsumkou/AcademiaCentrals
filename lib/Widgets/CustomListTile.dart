import 'package:academia_centrals/MyTheme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app_text.dart';

class CustomListTile extends StatelessWidget {
  final String leading, title;
  final Color? titleColor, leadingColor;
  final IconData? trailing;
  final Widget? childWidget;
  final void Function()? onTap;
  const CustomListTile(
      {super.key,
      required this.leading,
      required this.title,
      this.childWidget,
      this.trailing,
      this.titleColor,
      this.leadingColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 30,
      leading: SvgPicture.asset(
        leading,
        color: leadingColor ?? context.customTheme.iconColor,
      ),
      title: AppText(
        text: title,
        textColor: titleColor,
        fontSize: 16,
      ),
      trailing: childWidget ??
          Icon(
            trailing,
            color: context.customTheme.iconColor,
          ),
    );
  }
}
