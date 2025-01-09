import 'package:academia_centrals/AppAssets/app_assets.dart';
import 'package:academia_centrals/AppColors/app_colors.dart';
import 'package:academia_centrals/MyTheme/theme_extension.dart';
import 'package:academia_centrals/Routes/route_name.dart';
import 'package:academia_centrals/Screen/welcome_screen.dart';
import 'package:academia_centrals/Widgets/app_text.dart';
import 'package:academia_centrals/Widgets/custom_button.dart';
import 'package:academia_centrals/Widgets/custom_text_form_field.dart';
import 'package:academia_centrals/Widgets/login_screen/icon_button.dart';
import 'package:academia_centrals/controller/login_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final LoginController loginController = Get.put(LoginController());

  Future<void> loginUser() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const WelcomeScreen(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        String message;
        if (e.code == 'user-not-found') {
          message = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          message = 'Wrong password provided for that user.';
        } else if (e.code == 'weak-password') {
          message = 'The password provided is too weak.';
        } else {
          message = 'An error occurred. Please try again.';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('An unexpected error occurred.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: context.customTheme.bgcolor,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.login,
                    width: size.width * 0.7,
                    height: size.height * 0.27,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: size.height * 0.03),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      text: 'Welcome Back!',
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * 0.06,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  CustomTextFormField(
                    controller: _emailController,
                    labelText: 'Email',
                    hintText: 'Enter your email ID',
                    prefixIcon: Icons.email_outlined,
                  ),
                  SizedBox(height: size.height * 0.03),
                  Obx(
                    () => CustomTextFormField(
                      controller: _passwordController,
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      prefixIcon: Icons.lock_outline,
                      suffixIcon: loginController.obscureText.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      obscureText: loginController.obscureText.value,
                      onTap: loginController.togglePasswordVisibility,
                    ),
                  ),
                  SizedBox(height: size.height * 0.015),
                  Row(
                    children: [
                      Obx(
                        () => GestureDetector(
                          child: Container(
                            width: size.width * 0.036,
                            height: size.height * 0.017,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(color: Colors.white),
                              color: loginController.isChecked.value
                                  ? AppColors.primaryColor
                                  : Colors.transparent,
                            ),
                            child: loginController.isChecked.value
                                ? Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: size.height * 0.013,
                                  )
                                : null,
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      const AppText(text: 'Remember me', fontSize: 12),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          // Add forget password functionality here
                        },
                        child: const AppText(
                            text: 'Forget password?', fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.04),
                  CustomButton(
                    textColor: Colors.white,
                    label: 'Log in',
                    onTap: loginUser,
                  ),
                  SizedBox(height: size.height * 0.05),
                  const Row(children: <Widget>[
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: AppText(text: "Or continue with"),
                    ),
                    Expanded(child: Divider()),
                  ]),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const IconButtons(
                        icon: AppAssets.googleIcon,
                      ),
                      SizedBox(width: size.width * 0.05),
                      const IconButtons(
                        icon: AppAssets.facebookIcon,
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.04),
                  RichText(
                    text: TextSpan(
                      text: "Don’t have an account? ",
                      style: TextStyle(
                        color: context.customTheme.textColor,
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w400,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(RouteName.signUpScreen);
                            },
                          text: 'sign up',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: size.width * 0.04,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
