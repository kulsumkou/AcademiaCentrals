import 'package:academia_centrals/Routes/screen_rountes.dart';
import 'package:academia_centrals/Screen/onboarding.dart';
import 'package:academia_centrals/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'MyTheme/dark_theme.dart';
import 'MyTheme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
      getPages: AppRoutes.appRoutes(),
      theme: lightTheme(),
      darkTheme: darkTheme(),
    );
  }
}
