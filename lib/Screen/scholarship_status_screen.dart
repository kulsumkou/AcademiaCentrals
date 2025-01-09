import 'package:academia_centrals/AppAssets/app_assets.dart';
import 'package:academia_centrals/MyTheme/theme_extension.dart';
import 'package:academia_centrals/Widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ScholarshipStatusScreen extends StatefulWidget {
  const ScholarshipStatusScreen({Key? key}) : super(key: key);

  @override
  State<ScholarshipStatusScreen> createState() =>
      _ScholarshipStatusScreenState();
}

class _ScholarshipStatusScreenState extends State<ScholarshipStatusScreen> {
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
                    context.customTheme.bgcolor!.withOpacity(0.7),
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
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    scholarship['imagePath'] ?? '',
                    height: 200,
                    width: MediaQuery.of(context).size.width - 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
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
                        AppText(
                          text: scholarship['title'] ?? 'No title',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          textColor: Colors.white,
                        ),
                        const SizedBox(height: 10),
                        const AppText(
                          text: 'Your Application Status',
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          textColor: Colors.white,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                SvgPicture.asset(AppAssets.checkIcon),
                                const Divider(
                                  color: Colors.white,
                                  thickness: 4,
                                  height: 40,
                                ),
                                SvgPicture.asset(AppAssets.checkIcon),
                              ],
                            ),
                            const SizedBox(width: 20),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: 'Application Submitted',
                                    textColor: Colors.white,
                                  ),
                                  AppText(
                                    text: '24-08-2024 12:09 pm',
                                    fontSize: 12,
                                    textColor: Colors.white,
                                  ),
                                  SizedBox(height: 20),
                                  AppText(
                                    text: 'Your Application Is Under Review',
                                    textColor: Colors.white,
                                  ),
                                  AppText(
                                    text: '27-08-2024 05:23 pm',
                                    fontSize: 12,
                                    textColor: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
