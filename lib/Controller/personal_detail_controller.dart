import 'package:academia_centrals/AppColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:academia_centrals/Services/firestore_service.dart';

class PersonalDetailController extends GetxController {
  final FirestoreService _firestoreService = FirestoreService();

  var selectedTab = 0.obs;
  var selectedClass = 0.obs;
  var selectedGender = 0.obs;
  var selectedDegree = 0.obs;
  var selectedCountry = 0.obs;
  var selectedDistrict = 0.obs;
  var selectedCategory = 0.obs;

  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);

  // Method to save personal details to Firestore
  Future<void> savePersonalDetails() async {
    Map<String, dynamic> personalDetails = {
      'class': selectedClass.value,
      'degree': selectedDegree.value,
      'gender': selectedGender.value,
      'country': selectedCountry.value,
      'district': selectedDistrict.value,
      'category': selectedCategory.value,
      'date_of_birth': selectedDate.value != null
          ? selectedDate.value!.toIso8601String()
          : null,
    };
    await _firestoreService.addPersonalDetails(personalDetails);
  }

  void showCustomDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) {
      selectedDate.value = pickedDate;
    }
  }

  void selectClass(int? index) {
    selectedClass.value = index ?? 0;
  }

  void selectDegree(int? index) {
    selectedDegree.value = index ?? 0;
  }

  void selectGender(int? index) {
    selectedGender.value = index ?? 0;
  }

  void selectCountry(int? index) {
    selectedCountry.value = index ?? 0;
  }

  void selectDistrict(int? index) {
    selectedDistrict.value = index ?? 0;
  }

  void selectCategory(int? index) {
    selectedCategory.value = index ?? 0;
  }

  var iconColors = [
    AppColors.greyColor, // Color for Profile icon
    AppColors.greyColor, // Color for ID Verification icon
    AppColors.greyColor, // Color for File icon
  ];

  var iconSizes = [
    30.0, // Size for Profile icon
    30.0, // Size for ID Verification icon
    30.0, // Size for File icon
  ];
  @override
  void onInit() {
    super.onInit();
    selectedTab.value = 0;
    iconColors[selectedTab.value] = AppColors.primaryColor;
    iconSizes[selectedTab.value] = 35.0;
  }

  void setTab(int tabIndex) {
    selectedTab.value = tabIndex;

    iconColors[selectedTab.value] = AppColors.primaryColor;
    iconSizes[selectedTab.value] = 35.0;

    // Reset color and size for other icons
    for (var i = 0; i < iconColors.length; i++) {
      if (i != selectedTab.value) {
        iconColors[i] = AppColors.greyColor;
        iconSizes[i] = 30.0;
      }
    }

    // Update UI
    update();
  }
}
