import 'package:academia_centrals/AppAssets/app_assets.dart';
import 'package:academia_centrals/AppColors/app_colors.dart';
import 'package:academia_centrals/MyTheme/theme_extension.dart';
import 'package:academia_centrals/Routes/route_name.dart';
import 'package:academia_centrals/Widgets/CustomListTile.dart';
import 'package:academia_centrals/controller/themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});
  final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.customTheme.bgcolor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.greyColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(AppAssets.profile),
                      radius: 30,
                    ),
                    title: Text(
                      'Fahad Farooq',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      'fahadkhannn40@gmail.com',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const CustomListTile(
                    leading: AppAssets.personIcon,
                    title: 'Profile',
                  ),
                  const CustomListTile(
                    leading: AppAssets.lockIcon,
                    title: 'Change password',
                  ),
                  CustomListTile(
                    leading: AppAssets.notificationIcon,
                    title: 'Push Notifications',
                    onTap: () {
                      Get.toNamed(RouteName.notificationScreen);
                    },
                  ),
                  CustomListTile(
                    leading: AppAssets.themeIcon,
                    title: 'Dark mode',
                    childWidget: SizedBox(
                      height: 30,
                      width: 40,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Switch(
                          activeColor: Colors.white,
                          activeTrackColor: AppColors.primaryColor,
                          value: _themeController.isDarkMode.value,
                          onChanged: (newValue) {
                            _themeController.toggleTheme();
                          },
                        ),
                      ),
                    ),
                  ),
                  const CustomListTile(
                    leading: AppAssets.aboutIcon,
                    title: "About",
                  ),
                  CustomListTile(
                    onTap: () {
                      Get.toNamed(RouteName.doneScreen);
                    },
                    leading: AppAssets.faqIcon,
                    title: "All scholarships",
                  ),
                  const CustomListTile(
                    leading: AppAssets.settingIcon,
                    title: 'Settings ',
                  ),
                  const CustomListTile(
                    leading: AppAssets.contactusIcon,
                    title: 'Contact us',
                  ),
                  CustomListTile(
                    leading: AppAssets.logoutIcon,
                    title: 'Log out',
                    leadingColor: Colors.red,
                    titleColor: Colors.red,
                    onTap: () {
                      Get.toNamed(RouteName.loginScreen);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
