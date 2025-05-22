import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CardVerificationController extends GetxController {
  var pancards = false.obs;
  var pancardsOtp = false.obs;
  var allSet = false.obs;

  int waitDurationInSeconds = 2;

  var isValid = false.obs;

  final cartController = TextEditingController();
  final cartOtpController = TextEditingController();

  VoidCallback? onTap;

  @override
  void onInit() {
    super.onInit();
    cartController.addListener(validateInputs);
    cartOtpController.addListener(validateInputs);
  }

  void validateInputs() {
    isValid.value = cartController.text.length >= 10;
  }

  void showPancard() {
    pancards.value = true;
  }

  void verifyValue() {
    pancardsOtp.value = true;
    if (cartOtpController.text.length == 4 && cartController.text.length >= 10) {
      allSet.value = true;
      if (onTap != null) onTap!();
      pancards.value = false;
    }
  }

  @override
  void onClose() {
    cartController.dispose();
    cartOtpController.dispose();
    super.onClose();
  }
}