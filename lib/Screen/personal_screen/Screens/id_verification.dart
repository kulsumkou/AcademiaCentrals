import 'package:academia_centrals/AppColors/app_colors.dart';
import 'package:academia_centrals/MyTheme/theme_extension.dart';
import 'package:academia_centrals/Widgets/custom_dropdown_menu.dart';
import 'package:academia_centrals/Widgets/custom_text_form_field.dart';
import 'package:academia_centrals/controller/id_verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IDVerification extends StatefulWidget {
  const IDVerification({super.key});

  @override
  State<IDVerification> createState() => _IDVerificationState();
}

class _IDVerificationState extends State<IDVerification> {
  final IDVerificationController controller =
      Get.put(IDVerificationController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Obx(
              () => CustomDropdownButtonFormField(
                labelText: 'Document Type',
                value: controller.selectedDocumentType.value,
                onChanged: controller.selectDocumentType,
                items: [
                  DropdownMenuItem<int>(
                    value: 0,
                    child: Text(
                      "Select Document Type",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: controller.selectedDocumentType.value == 0
                            ? AppColors.lightTextColor
                            : context.customTheme.textColor,
                      ),
                    ),
                  ),
                  DropdownMenuItem<int>(
                    value: 1,
                    child: Text(
                      "ATM Card",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: controller.selectedDocumentType.value == 1
                            ? AppColors.primaryColor
                            : context.customTheme.textColor,
                      ),
                    ),
                  ),
                  DropdownMenuItem<int>(
                    value: 2,
                    child: Text(
                      "ID card",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: controller.selectedDocumentType.value == 2
                            ? AppColors.primaryColor
                            : context.customTheme.textColor,
                      ),
                    ),
                  ),
                  DropdownMenuItem<int>(
                    value: 3,
                    child: Text(
                      "Driving License card",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: controller.selectedDocumentType.value == 3
                            ? AppColors.primaryColor
                            : context.customTheme.textColor,
                      ),
                    ),
                  ),
                ],
                hintText: 'Select Type',
                hintColor: context.customTheme.textColor,
                enabledBorderColor: AppColors.greyColor,
                focusedBorderColor:
                    AppColors.primaryColor, // Changed to primaryColor
                fillColor: context.customTheme.bgcolor,
                primaryColor: AppColors.primaryColor, // Changed to primaryColor
              ),
            ),
            SizedBox(height: size.height * 0.02),
            const CustomTextFormField(
              labelText: 'ID Number',
              hintText: 'Enter your ID Number',
              hintTextColor:
                  AppColors.lightTextColor, // Changed to primaryColor
              textColor:
                  AppColors.primaryColor, // Added text color for consistency
            ),
            SizedBox(height: size.height * 0.02),
            CustomTextFormField(
              onTap: () {},
              readOnly: true,
              labelText: 'Upload ID',
              hintText: 'Aadhaar-card.pdf',
              hintTextColor: AppColors.primaryColor,
              suffixIcon: Icons.upload_file,
              suffixIconColor: AppColors.primaryColor,
              textColor:
                  AppColors.lightTextColor, // Added text color for consistency
            ),
          ],
        ),
      ),
    );
  }
}
