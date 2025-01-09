import 'package:academia_centrals/AppAssets/app_assets.dart';
import 'package:academia_centrals/MyTheme/theme_extension.dart';
import 'package:academia_centrals/Routes/route_name.dart';
import 'package:academia_centrals/Widgets/app_text.dart';
import 'package:academia_centrals/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoneScreen extends StatefulWidget {
  const DoneScreen({super.key});

  @override
  State<DoneScreen> createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customTheme.bgcolor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image.asset(AppAssets.done),
                const SizedBox(
                  height: 10,
                ),
                const AppText(
                  text: 'Congratulations!',
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
                ),
                const SizedBox(
                  height: 20,
                ),
                const AppText(
                  textAlign: TextAlign.center,
                  text:
                      'You have completed the first step towards your  educational goals.',
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
                const Spacer(),
                CustomButton(
                  textColor: Colors.white,
                  label: 'Done',
                  onTap: () {
                    Get.toNamed(RouteName.bottomNavigation);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
