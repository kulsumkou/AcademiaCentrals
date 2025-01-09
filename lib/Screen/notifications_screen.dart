import 'package:academia_centrals/AppAssets/app_assets.dart';
import 'package:academia_centrals/AppColors/app_colors.dart';
import 'package:academia_centrals/MyTheme/theme_extension.dart';
import 'package:academia_centrals/NotificationTabContent/all.dart';
import 'package:academia_centrals/NotificationTabContent/read.dart';
import 'package:academia_centrals/NotificationTabContent/unread.dart';
import 'package:academia_centrals/Widgets/app_text.dart';
import 'package:academia_centrals/controller/notifications_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<String> notificationType = ["All", "Read", "Unread"];
  final NotificationsController notificationController =
      Get.put(NotificationsController());
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.width < 600;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: context.customTheme.bgcolor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen ? size.width * 0.025 : 15,
                  vertical: isSmallScreen ? size.height * 0.007 : 5,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: isSmallScreen ? size.width * 0.008 : 5),
                      child: SvgPicture.asset(
                        AppAssets.backArrowIcon,
                        color: context.customTheme.iconColor,
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(thickness: 2, color: AppColors.darkGreyColor),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen ? size.width * 0.05 : 25,
                  vertical: isSmallScreen ? size.height * 0.015 : 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: 'Notifications',
                      fontWeight: FontWeight.w500,
                      fontSize: isSmallScreen ? 20 : 24,
                    ),
                    SizedBox(height: isSmallScreen ? 5 : 10),
                    Obx(
                      () => Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: isSmallScreen ? size.height * 0.007 : 5),
                        child: SizedBox(
                          width: size.width,
                          height: isSmallScreen ? size.height * 0.05 : 40,
                          child: TabBar(
                            dividerColor: Colors.transparent,
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  isSmallScreen ? size.height * 0.025 : 50),
                              color: Colors.transparent,
                            ),
                            onTap: (index) {
                              notificationController.changeTabIndex(index);
                            },
                            tabs: notificationType.map<Widget>((type) {
                              return Tab(
                                child: Container(
                                  padding: EdgeInsets.all(
                                      isSmallScreen ? size.height * 0.005 : 2),
                                  height:
                                      isSmallScreen ? size.height * 0.045 : 35,
                                  width: isSmallScreen ? size.width * 0.5 : 148,
                                  decoration: BoxDecoration(
                                    color:
                                        notificationController.selectedIndex ==
                                                notificationType.indexOf(type)
                                            ? AppColors.primaryColor
                                            : context.customTheme.bgcolor,
                                    borderRadius: BorderRadius.circular(
                                        isSmallScreen
                                            ? size.height * 0.025
                                            : 50),
                                    border: Border.all(
                                      color: notificationController
                                                  .selectedIndex ==
                                              notificationType.indexOf(type)
                                          ? Colors.transparent
                                          : AppColors.greyColor,
                                      width: 2,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      type,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .merge(
                                            TextStyle(
                                              color: notificationController
                                                          .selectedIndex ==
                                                      notificationType
                                                          .indexOf(type)
                                                  ? AppColors.whiteColor
                                                  : context
                                                      .customTheme.textColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: isSmallScreen ? 10 : 12,
                                            ),
                                          ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() {
                  switch (notificationController.selectedIndex) {
                    case 0:
                      return const All();
                    case 1:
                      return const Read();
                    case 2:
                      return const Unread();
                    default:
                      return const SizedBox.shrink();
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
