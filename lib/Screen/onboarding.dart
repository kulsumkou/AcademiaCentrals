import 'package:academia_centrals/AppAssets/app_assets.dart';
import 'package:academia_centrals/AppColors/app_colors.dart';
import 'package:academia_centrals/MyTheme/theme_extension.dart';
import 'package:academia_centrals/Routes/route_name.dart';
import 'package:academia_centrals/Widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () {
        Get.offNamed(RouteName.loginScreen);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customTheme.bgcolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 150,
              height: 288,
              child: Image.asset(AppAssets.splashIcon),
            ),
            const AppText(
              text: 'Academia Center',
              fontSize: 48,
              fontWeight: FontWeight.w700,
              textColor: AppColors.primaryColor,
            ),
            const AppText(
              text: 'Where Dreams Come True',
              fontSize: 16,
              textColor: AppColors.greyColor,
            ),
          ],
        ),
      ),
    );
  }
}
