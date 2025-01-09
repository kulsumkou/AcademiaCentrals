import 'package:academia_centrals/MyTheme/light_theme.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../MyTheme/dark_theme.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadTheme();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    saveTheme();
    updateTheme();
  }

  Future<void> loadTheme() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      isDarkMode.value = prefs.getBool('isDarkMode') ?? false;
      updateTheme();
    } catch (e) {
      // Handle error
    }
  }

  Future<void> saveTheme() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isDarkMode', isDarkMode.value);
    } catch (e) {
      // Handle error
    }
  }

  void updateTheme() {
    Get.changeTheme(isDarkMode.value ? darkTheme() : lightTheme());
  }
}
