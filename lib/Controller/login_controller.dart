import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool obscureText = true.obs;
  RxBool isChecked = false.obs;

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  void check() {
    isChecked.value = !isChecked.value;
  }
}
