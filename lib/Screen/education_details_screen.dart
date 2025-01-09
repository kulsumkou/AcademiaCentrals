import 'package:academia_centrals/AppAssets/app_assets.dart';
import 'package:academia_centrals/AppColors/app_colors.dart';
import 'package:academia_centrals/MyTheme/theme_extension.dart';
import 'package:academia_centrals/Widgets/app_text.dart';
import 'package:academia_centrals/Widgets/custom_button.dart';
import 'package:academia_centrals/Widgets/custom_dropdown_menu.dart';
import 'package:academia_centrals/controller/education_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EducationDetailsScreen extends StatefulWidget {
  const EducationDetailsScreen({super.key});

  @override
  State<EducationDetailsScreen> createState() => _EducationDetailsScreenState();
}

class _EducationDetailsScreenState extends State<EducationDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.width < 600;
    final bool isTabletScreen = size.width >= 600 && size.width < 1281;
    final EducationDetailController controller =
        Get.put(EducationDetailController());

    return Scaffold(
      backgroundColor: context.customTheme.bgcolor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen
                    ? size.width * 0.025
                    : isTabletScreen
                        ? size.width * 0.05
                        : 25,
                vertical: isSmallScreen
                    ? size.height * 0.007
                    : isTabletScreen
                        ? size.height * 0.015
                        : 20,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: isSmallScreen
                            ? size.width * 0.008
                            : isTabletScreen
                                ? size.width * 0.02
                                : 10),
                    child: SvgPicture.asset(
                      AppAssets.backArrowIcon,
                      color: context.customTheme.iconColor,
                    ),
                  ),
                ),
              ),
            ),
            const Divider(thickness: 2, color: AppColors.darkGreyColor),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen
                      ? size.width * 0.05
                      : isTabletScreen
                          ? size.width * 0.1
                          : 25,
                  vertical: isSmallScreen
                      ? size.height * 0.015
                      : isTabletScreen
                          ? size.height * 0.03
                          : 20,
                ),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    AppText(
                      text: 'Education Details',
                      fontWeight: FontWeight.w500,
                      fontSize: isSmallScreen ? 20 : 24,
                    ),
                    SizedBox(height: isSmallScreen ? 10 : 15),
                    Obx(
                      () => CustomDropdownButtonFormField(
                        labelText: 'Courses',
                        value: controller.selectedCourse.value,
                        onChanged: controller.selectCourse,
                        items: [
                          DropdownMenuItem<int>(
                            value: 0, // Change the value to null
                            child: Text(
                              "Select Type",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: controller.selectedCourse.value == 0
                                    ? AppColors.primaryColor
                                    : context.customTheme.textColor,
                              ),
                            ),
                          ),
                          DropdownMenuItem<int>(
                            value: 1,
                            child: Text(
                              "Post Graduation",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: controller.selectedCourse.value == 1
                                    ? AppColors.primaryColor
                                    : context.customTheme.textColor,
                              ),
                            ),
                          ),
                          DropdownMenuItem<int>(
                            value: 2,
                            child: Text(
                              "Pre Graduation",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: controller.selectedCourse.value == 2
                                    ? AppColors.primaryColor
                                    : context.customTheme.textColor,
                              ),
                            ),
                          ),
                        ],
                        hintText: 'Select Type',
                        hintColor: context.customTheme.textColor,
                        enabledBorderColor: AppColors.greyColor,
                        focusedBorderColor: AppColors.greyColor,
                        fillColor: context.customTheme.bgcolor,
                        primaryColor: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: isSmallScreen ? 15 : 20),
                    Obx(
                      () => CustomDropdownButtonFormField(
                        labelText: 'Degree',
                        value: controller.selectedDegree.value,
                        onChanged: controller.selectDegree,
                        items: [
                          DropdownMenuItem<int>(
                            value: 0, // Change the value to null
                            child: Text(
                              "Select Type",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: controller.selectedDegree.value == 0
                                    ? AppColors.primaryColor
                                    : context.customTheme.textColor,
                              ),
                            ),
                          ),
                          DropdownMenuItem<int>(
                            value: 1,
                            child: Text(
                              "MBA",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: controller.selectedDegree.value == 1
                                    ? AppColors.primaryColor
                                    : context.customTheme.textColor,
                              ),
                            ),
                          ),
                          DropdownMenuItem<int>(
                            value: 2,
                            child: Text(
                              "BS Software Engineering",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: controller.selectedDegree.value == 2
                                    ? AppColors.primaryColor
                                    : context.customTheme.textColor,
                              ),
                            ),
                          ),
                        ],
                        hintText: 'Select Type',
                        hintColor: context.customTheme.textColor,
                        enabledBorderColor: AppColors.greyColor,
                        focusedBorderColor: AppColors.greyColor,
                        fillColor: context.customTheme.bgcolor,
                        primaryColor: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: isSmallScreen ? 15 : 20),
                    Obx(
                      () => CustomDropdownButtonFormField(
                        labelText: 'Country Name',
                        value: controller.selectedCountry.value,
                        onChanged: controller.selectCountry,
                        items: [
                          DropdownMenuItem<int>(
                            value: 0, // Change the value to null
                            child: Text(
                              "Select Type",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: controller.selectedCountry.value == 0
                                    ? AppColors.primaryColor
                                    : context.customTheme.textColor,
                              ),
                            ),
                          ),
                          DropdownMenuItem<int>(
                            value: 1,
                            child: Text(
                              "Pakistan",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: controller.selectedCountry.value == 1
                                    ? AppColors.primaryColor
                                    : context.customTheme.textColor,
                              ),
                            ),
                          ),
                          DropdownMenuItem<int>(
                            value: 2,
                            child: Text(
                              "India",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: controller.selectedCountry.value == 2
                                    ? AppColors.primaryColor
                                    : context.customTheme.textColor,
                              ),
                            ),
                          ),
                        ],
                        hintText: 'Select Type',
                        hintColor: context.customTheme.textColor,
                        enabledBorderColor: AppColors.greyColor,
                        focusedBorderColor: AppColors.greyColor,
                        fillColor: context.customTheme.bgcolor,
                        primaryColor: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: isSmallScreen ? 15 : 20),
                    AppText(
                      text: 'Category',
                      fontSize: isSmallScreen ? 16 : 20,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: isSmallScreen ? 10 : 15),
                    Obx(() => Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: List.generate(
                            controller.selectedCategories.length,
                            (index) => CustomButton(
                              backgroundColor:
                                  controller.selectedCategories[index].value
                                      ? AppColors.primaryColor
                                      : Colors.transparent,
                              textColor:
                                  controller.selectedCategories[index].value
                                      ? Colors.white
                                      : context.customTheme.textColor,
                              onTap: () {
                                controller.selectCategory(index);
                              },
                              fontSize: isSmallScreen ? 12 : 14,
                              label: index == 0
                                  ? "All"
                                  : ["OBC", "BC", "SC", "ST"][index - 1],
                              height: isSmallScreen ? 36 : 40,
                              width: isSmallScreen
                                  ? MediaQuery.of(context).size.width * .278
                                  : MediaQuery.of(context).size.width * .25,
                              borderColor:
                                  controller.selectedCategories[index].value
                                      ? Colors.transparent
                                      : AppColors.greyColor,
                            ),
                          ),
                        )),
                    SizedBox(height: isSmallScreen ? 10 : 15),
                    AppText(
                      text: 'Gender',
                      fontSize: isSmallScreen ? 16 : 20,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: isSmallScreen ? 10 : 15),
                    Obx(() => Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: List.generate(
                            controller.selectedGenders.length,
                            (index) => CustomButton(
                              backgroundColor:
                                  controller.selectedGenders[index].value
                                      ? AppColors.primaryColor
                                      : Colors.transparent,
                              textColor: controller.selectedGenders[index].value
                                  ? Colors.white
                                  : context.customTheme.textColor,
                              onTap: () {
                                controller.selectedGender(index);
                              },
                              fontSize: isSmallScreen ? 12 : 14,
                              label: index == 0
                                  ? "Male"
                                  : [
                                      "Female",
                                      "Transgender",
                                      "Other",
                                      'all'
                                    ][index - 1],
                              height: isSmallScreen ? 36 : 40,
                              width: isSmallScreen
                                  ? MediaQuery.of(context).size.width * .278
                                  : MediaQuery.of(context).size.width * .25,
                              borderColor:
                                  controller.selectedGenders[index].value
                                      ? Colors.transparent
                                      : AppColors.greyColor,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen
                      ? size.width * 0.05
                      : isTabletScreen
                          ? size.width * 0.1
                          : 25,
                  vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    label: "Reset all",
                    width: isSmallScreen ? size.width * 0.4 : 144,
                    height: isSmallScreen ? size.height * 0.07 : 44,
                    backgroundColor: Colors.transparent,
                    borderColor: AppColors.greyColor,
                  ),
                  CustomButton(
                    textColor: Colors.white,
                    onTap: () {},
                    label: "Apply",
                    height: isSmallScreen ? size.height * 0.07 : 44,
                    width: isSmallScreen ? size.width * 0.4 : 144,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
