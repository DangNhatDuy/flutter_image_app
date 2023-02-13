import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UIHelper {
  static void showLoading() {
    if (Get.isDialogOpen ?? false) return;
    Get.dialog(
      Dialog(
        insetPadding: EdgeInsets.only(
          left: Get.width / 2 - 40,
          right: Get.width / 2 - 40,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            bottom: 16.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void hideLoading() {
    if (Get.isDialogOpen ?? false) Get.back();
  }

  static void showSnackbar(String? title, String message,
      {Color? backgroundColor, SnackPosition? snackPosition}) {
    Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: message,
        margin: const EdgeInsets.all(16.0),
        backgroundColor: backgroundColor ?? Colors.red,
        snackPosition: snackPosition ?? SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        borderRadius: 8.0,
      ),
    );
  }
}
