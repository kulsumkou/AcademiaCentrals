import 'package:academia_centrals/AppAssets/app_assets.dart';
import 'package:academia_centrals/AppColors/app_colors.dart';
import 'package:academia_centrals/Widgets/saved_card.dart';
import 'package:flutter/material.dart';
import 'package:academia_centrals/MyTheme/theme_extension.dart';
import 'package:academia_centrals/Widgets/app_text.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  final List<Map<String, String>> savedItems = [
    {
      'title': 'Global Learning\n Initiative 2023',
      'imagePath': AppAssets.saved1,
    },
    {
      'title': 'Tech Empowerment\n Program 2024',
      'imagePath': AppAssets.saved2,
    },
    {
      'title': 'Environmental Awareness\n Campaign 2025',
      'imagePath': AppAssets.saved3,
    },
    {
      'title': 'Tata & Wellness\n Conference 2023',
      'imagePath': AppAssets.feature1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isTabletScreen = size.width >= 600 && size.width < 1281;

    return Scaffold(
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
                  text: 'Saved Scholarships',
                  fontSize: isTabletScreen ? 30 : 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: isTabletScreen ? 20 : 10),
            const Divider(thickness: 2, color: AppColors.darkGreyColor),
            Expanded(
              child: ListView.builder(
                itemCount: savedItems.length,
                itemBuilder: (context, index) {
                  return SavedCard(
                    title: savedItems[index]['title']!,
                    imagePath: savedItems[index]['imagePath']!,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
