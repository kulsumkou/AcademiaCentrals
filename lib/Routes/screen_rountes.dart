import 'package:academia_centrals/Screen/scholarship_status_screen.dart';
import 'package:academia_centrals/Screen/applied_screen.dart';
import 'package:academia_centrals/Screen/done_screen.dart';
import 'package:academia_centrals/Screen/bottom_navigation.dart';
import 'package:academia_centrals/Screen/education_details_screen.dart';
import 'package:academia_centrals/Screen/explore%20screen/explore_screen.dart';
import 'package:academia_centrals/Screen/home_screen.dart';
import 'package:academia_centrals/Screen/notifications_screen.dart';
import 'package:academia_centrals/Screen/otp_screen.dart';
import 'package:academia_centrals/Screen/profile_screen.dart';
import 'package:academia_centrals/Screen/saved_screen.dart';
import 'package:academia_centrals/Screen/scholarship_detail_screen.dart';
import 'package:get/get.dart';
import '../Screen/personal_screen/personal_detail_screen.dart';
import 'route_name.dart';

import '../Screen/signup_screen.dart';
import '../Screen/welcome_screen.dart';

import '../Screen/login_screen.dart';
import '../Screen/onboarding.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.onboardingScreen,
          page: () => const OnboardingScreen(),
        ),
        GetPage(
          name: RouteName.loginScreen,
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: RouteName.signUpScreen,
          page: () => const SignupScreen(),
        ),
        GetPage(
          name: RouteName.welcomeScreen,
          page: () => const WelcomeScreen(),
        ),
        GetPage(
          name: RouteName.optScreen,
          page: () => const OtpScreen(),
        ),
        GetPage(
          name: RouteName.personalDetail,
          page: () => const PersonalDetailScreen(),
        ),
        GetPage(
          name: RouteName.doneScreen,
          page: () => const DoneScreen(),
        ),
        GetPage(
          name: RouteName.bottomNavigation,
          page: () => const bottomNavigation(),
        ),
        GetPage(
          name: RouteName.notificationScreen,
          page: () => const NotificationsScreen(),
        ),
        GetPage(
          name: RouteName.homeScreen,
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: RouteName.exploreScreen,
          page: () => const ExploreScreen(),
        ),
        GetPage(
          name: RouteName.appliedScreen,
          page: () => const AppliedScreen(),
        ),
        GetPage(
          name: RouteName.profileScreen,
          page: () => const ProfileScreen(),
        ),
        GetPage(
          name: RouteName.savedScreen,
          page: () => const SavedScreen(),
        ),
        GetPage(
          name: RouteName.scholarshipDetailScreen,
          page: () => const ScholarshipDetailScreen(),
        ),
        GetPage(
          name: RouteName.educationDetailsScreen,
          page: () => const EducationDetailsScreen(),
        ),
        GetPage(
          name: RouteName.scholarshipStatusScreen,
          page: () => const ScholarshipStatusScreen(),
        ),
      ];
}
