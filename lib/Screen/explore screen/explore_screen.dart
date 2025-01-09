import 'package:academia_centrals/AppColors/app_colors.dart';
import 'package:academia_centrals/MyTheme/theme_extension.dart';
import 'package:academia_centrals/NotificationTabContent/all.dart';
import 'package:academia_centrals/Routes/route_name.dart';
import 'package:academia_centrals/Screen/explore%20screen/explore%20tabs/tab_Content1.dart';
import 'package:academia_centrals/Widgets/app_text.dart';
import 'package:academia_centrals/controller/explore_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final ExploreScreenController controller = Get.put(ExploreScreenController());
  List<String> scholarshipType = ["All", "Merit-Based", "Upcoming"];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isTabletScreen = size.width >= 600 && size.width < 1281;
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        backgroundColor: context.customTheme.bgcolor,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: AppText(
                    text: 'Explore Scholarships',
                    fontSize: isTabletScreen ? 30 : 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: isTabletScreen ? 20 : 10),
              Obx(() => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: TabBar(
                        dividerColor: Colors.transparent,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.transparent,
                        ),
                        onTap: (index) {
                          controller.changeTabIndex(index);
                        },
                        tabs: scholarshipType.map<Widget>((type) {
                          return Tab(
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              width: isTabletScreen
                                  ? MediaQuery.of(context).size.width
                                  : 90,
                              decoration: BoxDecoration(
                                color: controller.selectedIndex ==
                                        scholarshipType.indexOf(type)
                                    ? AppColors.primaryColor
                                    : context.customTheme.bgcolor,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: controller.selectedIndex ==
                                          scholarshipType.indexOf(type)
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
                                          color: controller.selectedIndex ==
                                                  scholarshipType.indexOf(type)
                                              ? AppColors.whiteColor
                                              : context.customTheme.textColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: isTabletScreen ? 20 : 12,
                                        ),
                                      ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  )),
              SizedBox(height: isTabletScreen ? 20 : 10),
              const Divider(thickness: 2, color: AppColors.darkGreyColor),
              Expanded(
                child: Obx(() {
                  switch (controller.selectedIndex) {
                    case 0:
                      return const ExploreTabs();
                    case 1:
                      return const All();
                    case 2:
                      return const All();
                    default:
                      return const SizedBox.shrink();
                  }
                }),
              ),
            ],
          ),
        ),
        floatingActionButton: SizedBox(
          height: isTabletScreen ? 100 : 50,
          width: isTabletScreen ? 100 : 50,
          child: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {
              Get.toNamed(RouteName.educationDetailsScreen);
            },
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
            child: Icon(
              Icons.filter_alt_outlined,
              color: AppColors.whiteColor,
              size: isTabletScreen ? 50 : 30,
            ), // No shadow
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
