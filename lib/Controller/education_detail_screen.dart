import 'package:get/get.dart';

class EducationDetailController extends GetxController {
  var selectedCourse = 0.obs;
  var selectedDegree = 0.obs;
  var selectedCountry = 0.obs;
  RxString? selectedType;

  void selectCourse(int? index) {
    selectedCourse.value = index ?? 0;
  }
  void selectDegree(int? index) {
    selectedDegree.value = index ?? 0;
  }
  void selectCountry(int? index) {
    selectedCountry.value = index ?? 0;
  }




  List<RxBool> selectedCategories = List.generate(5, (index) => index == 0 ? true.obs : false.obs);

  void selectCategory(int index) {
    for (int i = 0; i < selectedCategories.length; i++) {
      if (i == index) {
        selectedCategories[i].value = true;
      } else {
        selectedCategories[i].value = false;
      }
    }
    update();
  }
  List<RxBool> selectedGenders = List.generate(4, (index) => index == 0 ? true.obs : false.obs);


  void selectedGender(int index) {
    for (int i = 0; i < selectedGenders.length; i++) {
      if (i == index) {
        selectedGenders[i].value = true;
      } else {
        selectedGenders[i].value = false;
      }
    }
    update();
  }
}
