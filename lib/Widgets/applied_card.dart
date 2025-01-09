import 'package:academia_centrals/AppColors/app_colors.dart';
import 'package:academia_centrals/Routes/route_name.dart';
import 'package:academia_centrals/Widgets/app_text.dart';
import 'package:academia_centrals/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppliedCard extends StatelessWidget {
  final String imageAsset;
  final String description;
  const AppliedCard({
    super.key,
    required this.imageAsset,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.width < 600;
    final double imageWidth =
        isSmallScreen ? size.width * 0.4 : size.width * 0.2;
    final bool isTabletScreen = size.width >= 600 && size.width < 1281;

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 10 : 18, vertical: isSmallScreen ? 5 : 7),
      padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 10 : 15,
          vertical: isSmallScreen ? 10 : 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF687473).withOpacity(0.3),
            const Color(0xFF687473).withOpacity(0.3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imageAsset,
                    width: imageWidth,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: isSmallScreen ? 10 : 20),
              Expanded(
                flex: 2,
                child: AppText(
                  text: description,
                  fontWeight: FontWeight.w400,
                  fontSize: isTabletScreen
                      ? 25
                      : isSmallScreen
                          ? 10
                          : 12,
                ),
              ),
            ],
          ),
          SizedBox(height: isSmallScreen ? 10 : 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: CustomButton(
                  textColor: AppColors.whiteColor,
                  onTap: () {},
                  fontSize: isSmallScreen ? 10 : 12,
                  label: "View details",
                  height: isSmallScreen ? 30 : 36,
                  backgroundColor: AppColors.primaryColor,
                  borderRadius: 8,
                ),
              ),
              SizedBox(width: isSmallScreen ? 10 : 20),
              Expanded(
                flex: 2,
                child: CustomButton(
                  textColor: AppColors.whiteColor,
                  onTap: () {
                    Get.toNamed(RouteName.doneScreen);
                  },
                  fontSize: isSmallScreen ? 10 : 12,
                  label: "Check Status",
                  height: isSmallScreen ? 30 : 36,
                  backgroundColor: AppColors.primaryColor,
                  borderRadius: 8,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
