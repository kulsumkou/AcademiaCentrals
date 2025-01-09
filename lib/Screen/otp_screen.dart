import 'package:academia_centrals/AppColors/app_colors.dart';
import 'package:academia_centrals/MyTheme/theme_extension.dart';
import 'package:academia_centrals/Widgets/app_text.dart';
import 'package:academia_centrals/Widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../Routes/route_name.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isTablet = size.width > 600;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      backgroundColor: context.customTheme.bgcolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.02),
              AppText(
                text: 'OTP Verification',
                fontSize: isTablet ? 36 : 28,
                fontWeight: FontWeight.bold,
                textColor: AppColors.lightTextColor,
              ),
              SizedBox(height: size.height * 0.02),
              AppText(
                text: 'Enter the OTP sent to +92102566871',
                fontSize: isTablet ? 20 : 16,
                fontWeight: FontWeight.bold,
                textColor: AppColors.greyColor,
              ),
              SizedBox(height: size.height * 0.05),
              Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                showCursor: true,
                onCompleted: (pin) => print("Entered OTP: $pin"),
              ),
              SizedBox(height: size.height * 0.02),
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    text: "Didn’t receive OTP? ",
                    style: TextStyle(
                      color: context.customTheme.textColor,
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(RouteName.personalDetail);
                          },
                        text: 'Resend',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: size.width * 0.03,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              CustomButton(
                textColor: Colors.white,
                label: 'Verify',
                onTap: () {
                  Get.toNamed(RouteName.personalDetail);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
