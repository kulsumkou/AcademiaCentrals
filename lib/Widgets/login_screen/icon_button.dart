import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconButtons extends StatelessWidget {
  final String icon;
  final VoidCallback? onTap;

  const IconButtons({
    Key? key,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * 0.2,
        height: size.height * 0.05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.height * 0.1),
          border: Border.all(color: Colors.grey, width: 1.5),
        ),
        child: Padding(
          padding: EdgeInsets.all(size.height * 0.01),
          child: SvgPicture.asset(
            icon,
            width: size.width * 0.04,
            height: size.width * 0.04,
          ),
        ),
      ),
    );
  }
}
