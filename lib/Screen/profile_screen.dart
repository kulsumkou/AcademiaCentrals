import 'package:academia_centrals/AppAssets/app_assets.dart';
import 'package:academia_centrals/AppColors/app_colors.dart';
import 'package:academia_centrals/MyTheme/theme_extension.dart';
import 'package:academia_centrals/Widgets/CustomListTile.dart';
import 'package:academia_centrals/Widgets/app_text.dart';
import 'package:academia_centrals/Widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isPersonalInfoExpanded = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.width < 600;

    return Scaffold(
      backgroundColor: context.customTheme.bgcolor,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: isSmallScreen ? size.height * 0.25 : 178,
                  child: Column(
                    children: [
                      Container(
                        height: isSmallScreen ? size.height * 0.18 : 128,
                        color: AppColors.greyColor,
                      ),
                      const AppText(
                        text: 'Fahad Farooq',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      const AppText(
                        text: 'Post UnGraduation',
                        fontSize: 12,
                        textColor: AppColors.greyColor,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: isSmallScreen ? size.height * 0.03 : 22,
                  left: isSmallScreen ? size.width * 0.05 : 30,
                  child: Container(
                    height: isSmallScreen ? size.height * 0.1 : 72,
                    width: isSmallScreen ? size.height * 0.1 : 72,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          isSmallScreen ? size.height * 0.05 : 36),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          isSmallScreen ? size.height * 0.05 : 36),
                      child: Image.asset(
                        AppAssets.profile,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  CustomListTile(
                    leading: AppAssets.personIcon,
                    title: 'Personal Information',
                    trailing: _isPersonalInfoExpanded
                        ? Icons.keyboard_arrow_down_outlined
                        : Icons.arrow_forward_ios_outlined,
                    onTap: () {
                      setState(() {
                        _isPersonalInfoExpanded = !_isPersonalInfoExpanded;
                      });
                    },
                  ),
                  if (_isPersonalInfoExpanded) ...[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isSmallScreen ? size.width * 0.05 : 30,
                        vertical: isSmallScreen ? size.height * 0.02 : 20,
                      ),
                      child: Column(
                        children: [
                          const CustomTextFormField(
                            labelText: 'First name',
                            hintText: 'Fahad',
                            prefixIcon: Icons.person_2_outlined,
                          ),
                          SizedBox(
                            height: isSmallScreen ? size.height * 0.02 : 20,
                          ),
                          const CustomTextFormField(
                            labelText: 'Last name',
                            hintText: 'Farooq',
                            prefixIcon: Icons.person_2_outlined,
                          ),
                          SizedBox(
                            height: isSmallScreen ? size.height * 0.02 : 20,
                          ),
                          const CustomTextFormField(
                            labelText: 'Mobile number',
                            hintText: '+923102566871',
                            prefixIcon: Icons.phone_outlined,
                          ),
                          SizedBox(
                            height: isSmallScreen ? size.height * 0.02 : 20,
                          ),
                          const CustomTextFormField(
                            labelText: 'Date of Birth',
                            hintText: '13-01-2005',
                            prefixIcon: Icons.calendar_month_outlined,
                          ),
                          SizedBox(
                            height: isSmallScreen ? size.height * 0.02 : 20,
                          ),
                          const CustomTextFormField(
                            labelText: 'Gender',
                            hintText: 'Male',
                            prefixIcon: Icons.phone_outlined,
                          ),
                          SizedBox(
                            height: isSmallScreen ? size.height * 0.02 : 20,
                          ),
                          const CustomTextFormField(
                            labelText: 'Email ID',
                            hintText: 'fahadkhannn40@gmail.com',
                            prefixIcon: Icons.email_outlined,
                          ),
                        ],
                      ),
                    ),
                  ],
                  const CustomListTile(
                    leading: AppAssets.educationIcon,
                    title: 'Education Details',
                    trailing: Icons.arrow_forward_ios_outlined,
                  ),
                  const CustomListTile(
                    leading: AppAssets.filesIcon,
                    title: 'My Documents',
                    trailing: Icons.arrow_forward_ios_outlined,
                  ),
                  const CustomListTile(
                    leading: AppAssets.appliedIcon,
                    title: 'Applied Scholarship',
                    trailing: Icons.arrow_forward_ios_outlined,
                  ),
                  const CustomListTile(
                    leading: AppAssets.feedbackIcon,
                    title: 'Send Feedback',
                    trailing: Icons.arrow_forward_ios_outlined,
                  ),
                  const CustomListTile(
                    leading: AppAssets.privacyIcon,
                    title: 'Privacy Policy',
                    trailing: Icons.arrow_forward_ios_outlined,
                  ),
                  const CustomListTile(
                    leading: AppAssets.helpIcon,
                    title: 'Help & Support',
                    trailing: Icons.arrow_forward_ios_outlined,
                  ),
                  const CustomListTile(
                    leading: AppAssets.settingIcon,
                    title: 'settings',
                    trailing: Icons.arrow_forward_ios_outlined,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
