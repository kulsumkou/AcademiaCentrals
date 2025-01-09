


import 'package:get/get.dart';

class IDVerificationController  extends GetxController{
  var selectedDocumentType = 0.obs;
  void selectDocumentType(int? index) {
    selectedDocumentType.value = index ?? 0;
  }
}