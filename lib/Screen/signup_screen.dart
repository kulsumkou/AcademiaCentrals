// ignore_for_file: use_build_context_synchronously

import 'package:academia_centrals/AppAssets/app_assets.dart';
import 'package:academia_centrals/AppColors/app_colors.dart';
import 'package:academia_centrals/MyTheme/theme_extension.dart';
import 'package:academia_centrals/Screen/login_screen.dart';
import 'package:academia_centrals/Widgets/app_text.dart';
import 'package:academia_centrals/Widgets/custom_button.dart';
import 'package:academia_centrals/Widgets/custom_text_form_field.dart';
import 'package:academia_centrals/Widgets/login_screen/icon_button.dart';
import 'package:academia_centrals/controller/signup_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Routes/route_name.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Registration Function
  RegistrationUser(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text.trim() !=
          _confirmPasswordController.text.trim()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Passwords do not match.')),
        );
        return;
      }

      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        await FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .set({
          'name': _nameController.text.trim(),
          'lastName': _lastNameController.text.trim(),
          'phoneNumber': _phoneNumberController.text.trim(),
          'email': _emailController.text.trim(),
        });

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('The password provided is too weak.')),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('The account already exists for that email.')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('An error occurred. Please try again.')),
        );
      }
    }
  }

  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: context.customTheme.bgcolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const AppText(
                      text: 'Create your account',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: size.height * 0.03),
                    CustomTextFormField(
                      controller: _nameController,
                      labelText: 'First name',
                      hintText: 'Enter your first name',
                      prefixIcon: Icons.person_2_outlined,
                    ),
                    SizedBox(height: size.height * 0.03),
                    CustomTextFormField(
                      controller: _lastNameController,
                      labelText: 'Last name',
                      hintText: 'Enter your last name',
                      prefixIcon: Icons.person_2_outlined,
                    ),
                    SizedBox(height: size.height * 0.03),
                    CustomTextFormField(
                      controller: _phoneNumberController,
                      labelText: 'Mobile number',
                      hintText: 'Enter 10 digit mobile number',
                      prefixIcon: Icons.phone_outlined,
                    ),
                    SizedBox(height: size.height * 0.03),
                    CustomTextFormField(
                      controller: _emailController,
                      labelText: 'Email ID',
                      hintText: 'Enter your email ID',
                      prefixIcon: Icons.email_outlined,
                    ),
                    SizedBox(height: size.height * 0.03),
                    Obx(
                      () => CustomTextFormField(
                        controller: _passwordController,
                        prefixIcon: Icons.lock_outline,
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        suffixIcon: signupController.obscureText1.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        obscureText: signupController.obscureText1.value,
                        onTap: signupController.togglePasswordVisibility1,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Obx(
                      () => CustomTextFormField(
                        controller: _confirmPasswordController,
                        prefixIcon: Icons.lock_outline,
                        labelText: 'Confirm Password',
                        hintText: 'Re-enter your password',
                        suffixIcon: signupController.obscureText2.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        obscureText: signupController.obscureText2.value,
                        onTap: signupController.togglePasswordVisibility2,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Align(
                      alignment: Alignment.topLeft,
                      child: RichText(
                        text: TextSpan(
                          text: "By clicking Sign Up, you agree to our ",
                          style: TextStyle(
                              color: context.customTheme.textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                          children: const <TextSpan>[
                            TextSpan(
                              text: 'Terms of Service \n',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: AppColors.primaryColor),
                            ),
                            TextSpan(
                              text: 'and ',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: AppColors.primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    CustomButton(
                      textColor: Colors.white,
                      label: 'Sign up',
                      onTap: () {
                        RegistrationUser(context);
                      },
                    ),
                    SizedBox(height: size.height * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButtons(
                          icon: AppAssets.googleIcon,
                          onTap: () {},
                        ),
                        SizedBox(width: size.width * 0.05),
                        IconButtons(
                          icon: AppAssets.facebookIcon,
                          onTap: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                          color: context.customTheme.textColor,
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w400,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(RouteName.loginScreen);
                              },
                            text: 'sign in',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: size.width * 0.04,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
