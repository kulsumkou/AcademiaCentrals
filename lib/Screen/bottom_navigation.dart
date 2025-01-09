import 'package:academia_centrals/AppAssets/app_assets.dart';
import 'package:academia_centrals/AppColors/app_colors.dart';
import 'package:academia_centrals/MyTheme/theme_extension.dart';
import 'package:academia_centrals/controller/bottom_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class bottomNavigation extends StatelessWidget {
  const bottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isTabletScreen = size.width >= 600 && size.width < 1281;
    final BottomNavigationController bottomNavigationController =
        Get.put(BottomNavigationController());
    return Obx(
      () => Scaffold(
        body: bottomNavigationController
            .pages[bottomNavigationController.myCurrentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: isTabletScreen ? 20 : 14,
          unselectedFontSize: isTabletScreen ? 18 : 12,
          backgroundColor: context.customTheme.bgcolor,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.greyColor,
          showUnselectedLabels: true,
          onTap: (index) => bottomNavigationController.onTap(index),
          currentIndex: bottomNavigationController.myCurrentIndex.value,
          items: [
            BottomNavigationBarItem(
              backgroundColor: context.customTheme.bgcolor,
              icon: Icon(
                Icons.home_outlined,
                size: isTabletScreen ? 40 : 25,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              backgroundColor: context.customTheme.bgcolor,
              icon: Icon(
                Icons.explore_outlined,
                size: isTabletScreen ? 40 : 25,
              ),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              backgroundColor: context.customTheme.bgcolor,
              icon: SvgPicture.asset(
                AppAssets.appliedIcon,
                width: isTabletScreen ? 40 : 24,
                height: isTabletScreen ? 40 : 24,
                color: bottomNavigationController.myCurrentIndex.value == 2
                    ? AppColors.primaryColor
                    : AppColors.greyColor,
              ),
              label: "Applied",
            ),
            BottomNavigationBarItem(
              backgroundColor: context.customTheme.bgcolor,
              icon: SvgPicture.asset(
                AppAssets.saveIcon,
                width: isTabletScreen ? 40 : 24,
                height: isTabletScreen ? 40 : 24,
                color: bottomNavigationController.myCurrentIndex.value == 3
                    ? AppColors.primaryColor
                    : AppColors.greyColor,
              ),
              label: "Saved",
            ),
            BottomNavigationBarItem(
              backgroundColor: context.customTheme.bgcolor,
              icon: Icon(
                Icons.person_outline,
                size: isTabletScreen ? 40 : 25,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
