import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  final String imagePath;
  const CustomBanner({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          height: 90,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
