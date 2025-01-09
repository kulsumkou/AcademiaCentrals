import 'package:academia_centrals/AppAssets/app_assets.dart';
import 'package:academia_centrals/AppColors/app_colors.dart';
import 'package:academia_centrals/MyTheme/theme_extension.dart';
import 'package:academia_centrals/Routes/route_name.dart';
import 'package:academia_centrals/Widgets/app_text.dart';
import 'package:academia_centrals/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ScholarshipCard extends StatelessWidget {
  final String imageAsset;
  final String scholarships;
  final String eligibility;
  final String description;

  const ScholarshipCard({
    super.key,
    required this.imageAsset,
    required this.scholarships,
    required this.eligibility,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.width < 600;
    final double cardHeight = isSmallScreen ? 200 : 300;
    final bool isTabletScreen = size.width >= 600 && size.width < 1281;
    final double imageWidth =
        isSmallScreen ? size.width * 0.35 : size.width * 0.2;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey.withOpacity(0.3),
            Colors.black.withOpacity(0.5),
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
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: cardHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
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
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: 'Award',
                                    fontWeight: FontWeight.w600,
                                    fontSize: isTabletScreen ? 25 : 12,
                                  ),
                                  AppText(
                                    text: scholarships,
                                    fontSize: isTabletScreen ? 20 : 9,
                                  ),
                                ],
                              ),
                              SvgPicture.asset(
                                AppAssets.saveIcon,
                                color: context.customTheme.iconColor,
                                width: isTabletScreen ? 40 : 22,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          AppText(
                            text: 'Eligibility',
                            fontWeight: FontWeight.w600,
                            fontSize: isTabletScreen ? 25 : 12,
                          ),
                          AppText(
                            text: eligibility,
                            fontSize: isTabletScreen ? 20 : 9,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Text(
                    description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: isTabletScreen ? 18 : 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: CustomButton(
                  textColor: Colors.white,
                  label: 'View Scholarship Details',
                  height: isSmallScreen ? 36 : 40,
                  backgroundColor: AppColors.primaryColor,
                  borderRadius: 8,
                  onTap: () {
                    Get.toNamed(
                      RouteName.scholarshipDetailScreen,
                      arguments: {
                        'imageAsset': imageAsset,
                        'scholarships': scholarships,
                        'eligibility': eligibility,
                        'description': description,
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
