import 'package:get/get.dart';

class SignupController extends GetxController {
  RxBool obscureText1 = true.obs;
  RxBool obscureText2 = true.obs;

  void togglePasswordVisibility1() {
    obscureText1.value = !obscureText1.value;
  }

  void togglePasswordVisibility2() {
    obscureText2.value = !obscureText2.value;
  }
}
