import 'package:academia_centrals/MyTheme/theme_extension.dart';
import 'package:academia_centrals/Routes/route_name.dart';
import 'package:academia_centrals/Widgets/app_text.dart';
import 'package:academia_centrals/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String scholarship;
  final String graduate;

  const CustomCard({
    super.key,
    required this.imagePath,
    required this.scholarship,
    required this.graduate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 252,
      width: 196,
      decoration: BoxDecoration(
        color: context.customTheme.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          Image.asset(imagePath),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const AppText(
                text: 'Award',
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
              AppText(
                text: scholarship,
                fontSize: 12,
              ),
              const SizedBox(
                height: 7,
              ),
              const AppText(
                text: 'UEligibility',
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
              AppText(
                text: graduate,
                fontSize: 12,
              ),
            ]),
          ),
          const Spacer(),
          CustomButton(
            textColor: Colors.white,
            label: 'View Details',
            height: 30,
            width: 150,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            onTap: () {
              Get.toNamed(RouteName.educationDetailsScreen);
            },
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
