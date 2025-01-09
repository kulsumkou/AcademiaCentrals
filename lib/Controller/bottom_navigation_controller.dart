import 'package:academia_centrals/Screen/applied_screen.dart';
import 'package:academia_centrals/Screen/explore%20screen/explore_screen.dart';
import 'package:academia_centrals/Screen/home_screen.dart';
import 'package:academia_centrals/Screen/profile_screen.dart';
import 'package:academia_centrals/Screen/saved_screen.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  RxInt myCurrentIndex = 0.obs;
  final pages = [
    const HomeScreen(),
    const ExploreScreen(),
    const AppliedScreen(),
    const SavedScreen(),
    const ProfileScreen()
  ];

  void onTap(int index) {
    myCurrentIndex.value = index;
  }
}
