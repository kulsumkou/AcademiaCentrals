import 'package:academia_centrals/Routes/route_name.dart';
import 'package:academia_centrals/Widgets/app_text.dart';
import 'package:academia_centrals/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SavedCard extends StatefulWidget {
  final String title;
  final String imagePath;

  const SavedCard({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  State<SavedCard> createState() => _SavedCardState();
}

class _SavedCardState extends State<SavedCard> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.width < 600;
    final bool isTabletScreen = size.width >= 600 && size.width < 1024;

    return Container(
      height: isSmallScreen
          ? size.height * 0.18
          : isTabletScreen
              ? size.height * 0.18
              : size.height * 0.3,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: isSmallScreen ? 10 : 20),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: widget.title,
                  fontSize: isSmallScreen
                      ? 14
                      : isTabletScreen
                          ? 30
                          : 25,
                  fontWeight: FontWeight.bold,
                ),
                CustomButton(
                  textColor: Colors.white,
                  label: 'View Details',
                  height: 30,
                  width: double.infinity,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  onTap: () {
                    Get.toNamed(
                      RouteName.scholarshipStatusScreen,
                      arguments: {
                        'imagePath': widget.imagePath,
                        'title': widget.title,
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
