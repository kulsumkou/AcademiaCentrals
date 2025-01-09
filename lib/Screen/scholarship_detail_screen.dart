import 'package:academia_centrals/AppAssets/app_assets.dart';
import 'package:academia_centrals/AppColors/app_colors.dart';
import 'package:academia_centrals/MyTheme/theme_extension.dart';
import 'package:academia_centrals/Widgets/app_text.dart';
import 'package:academia_centrals/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ScholarshipDetailScreen extends StatefulWidget {
  const ScholarshipDetailScreen({super.key});

  @override
  State<ScholarshipDetailScreen> createState() =>
      _ScholarshipDetailScreenState();
}

class _ScholarshipDetailScreenState extends State<ScholarshipDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? scholarship =
        Get.arguments as Map<String, dynamic>?;

    if (scholarship == null) {
      return const Scaffold(
        body: Center(
          child: Text('No scholarship data found'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: context.customTheme.bgcolor,
      appBar: AppBar(
        backgroundColor: context.customTheme.bgcolor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: SvgPicture.asset(
            AppAssets.backArrowIcon,
            color: Colors.white,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.customTheme.bgcolor!.withOpacity(0.5),
                    context.customTheme.bgcolor!.withOpacity(0.5),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: Container(
                height: 172,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    scholarship['imageAsset'] ?? '',
                    height: 172,
                    width: MediaQuery.of(context).size.width - 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Positioned(
                  right: 0,
                  top: 0,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.2),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: context.customTheme.bgcolor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: AppText(
                                    text: scholarship['scholarships'] ??
                                        'No scholarships',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                SvgPicture.asset(
                                  AppAssets.shareIcon,
                                  color: context.customTheme.iconColor,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: AppText(
                                    text: scholarship['eligibility'] ??
                                        'Eligibility not specified',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    textColor: AppColors.primaryColor,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                SvgPicture.asset(
                                  AppAssets.saveIcon,
                                  color: context.customTheme.iconColor,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            const AppText(
                              text: 'About the Scholarship',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(height: 10),
                            AppText(
                              text: scholarship['description'] ??
                                  'No description available.',
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 20),
                            const Align(
                              alignment: Alignment.bottomCenter,
                              child: CustomButton(
                                textColor: Colors.white,
                                label: 'Apply Now',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
