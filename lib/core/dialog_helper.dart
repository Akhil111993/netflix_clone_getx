import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  //UI for all dialogs, loadings, snackbars and toasts using getx library

  //show dialog

  static void showErrorDialog(
      {String title = 'Error', String desc = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        child: Column(
          children: [
            Text(title),
            Text(desc),
            ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen ?? false) Get.back();
                },
                child: const Text('OK'))
          ],
        ),
      ),
    );
  }
  //show toast
  //show snack bar
  //show loading

  static void showLoading([String message = '']) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Center(
              child: CircularProgressIndicator(),
            ),
            Text(message),
          ],
        ),
      ),
    );
  }

  static void hideLoading() {
    if (Get.isDialogOpen ?? false) Get.back();
  }
}
