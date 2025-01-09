import 'package:academia_centrals/AppAssets/app_assets.dart';
import 'package:academia_centrals/AppColors/app_colors.dart';
import 'package:academia_centrals/MyTheme/theme_extension.dart';
import 'package:academia_centrals/Routes/route_name.dart';
import 'package:academia_centrals/Widgets/app_text.dart';
import 'package:academia_centrals/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final bool isTablet = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: context.customTheme.bgcolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.02),
              AppText(
                text: 'Welcome to Academia Center',
                fontSize: isTablet ? 36 : 28,
                fontWeight: FontWeight.bold,
                textColor: AppColors.lightTextColor,
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryColor.withOpacity(0.3),
                      AppColors.primaryColor.withOpacity(0.1)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryColor.withOpacity(0.2),
                      offset: const Offset(0, 10),
                      blurRadius: 20,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  AppAssets.welcome,
                  height: isTablet ? 300 : 200,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              AppText(
                textAlign:
                    TextAlign.justify, // Aligns the text with justification
                text:
                    "We're excited to help you find the perfect scholarships for you. "
                    "To get started, please fill in a few basic details about yourself. "
                    "This will help us recommend the best matching scholarships that fit "
                    "your needs.",
                fontSize: isTablet ? 20 : 16,
                textColor: AppColors.greyColor,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    label: "I'll do later",
                    width: isTablet ? 200 : 150,
                    backgroundColor: Colors.transparent,
                    borderColor: AppColors.lightTextColor,
                    textColor: AppColors.lightTextColor,
                    borderRadius: 30,
                    onTap: () {
                      Get.toNamed(RouteName.loginScreen);
                    },
                  ),
                  SizedBox(width: size.width * 0.03),
                  CustomButton(
                    textColor: Colors.white,
                    onTap: () {
                      Get.toNamed(RouteName.optScreen);
                    },
                    label: "Get Started",
                    width: isTablet ? 200 : 150,
                    backgroundColor: AppColors.primaryColor,
                    borderRadius: 30,
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
