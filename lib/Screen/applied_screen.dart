import 'package:academia_centrals/AppAssets/app_assets.dart';
import 'package:academia_centrals/AppColors/app_colors.dart';
import 'package:academia_centrals/MyTheme/theme_extension.dart';
import 'package:academia_centrals/Widgets/app_text.dart';
import 'package:academia_centrals/Widgets/applied_card.dart';
import 'package:flutter/material.dart';

class AppliedScreen extends StatefulWidget {
  const AppliedScreen({super.key});

  @override
  State<AppliedScreen> createState() => _AppliedScreenState();
}

class _AppliedScreenState extends State<AppliedScreen> {
  // Sample list of applied scholarships
  final List<Map<String, String>> appliedScholarships = [
    {
      'imageAsset': AppAssets.status,
      'description': 'Medhaavi Engineering Scholarship Program',
    },
    {
      'imageAsset': AppAssets.status1,
      'description': 'National Science Scholarship Program',
    },
    {
      'imageAsset': AppAssets.card2,
      'description': 'Global Leaders Scholarship Program',
    },
    {
      'imageAsset': AppAssets.card3,
      'description': 'Women in Tech Scholarship Program',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customTheme.bgcolor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: AppText(
                  text: 'Applied Scholarships',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Divider(thickness: 2, color: AppColors.darkGreyColor),
            Expanded(
              child: ListView.builder(
                itemCount: appliedScholarships.length,
                itemBuilder: (context, index) {
                  final scholarship = appliedScholarships[index];
                  return AppliedCard(
                    imageAsset: scholarship['imageAsset']!,
                    description: scholarship['description']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
