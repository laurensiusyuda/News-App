import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:dummy_project_1/common/utils/storage_util.dart';
import 'package:dummy_project_1/routes/pages.dart';

class AuthController extends GetxController {
  // Form key validator
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailFC = TextEditingController();
  final TextEditingController passwordFC = TextEditingController();

  final RxBool showPassword = true.obs;
  final RxBool isValidUser = false.obs;
  final RxBool isLoading = false.obs;

  // Dummy user
  final List<Map<String, String>> dummyUsers = [
    {"email": "laurensiusyuda87@gmail.com", "password": "Password2!"},
    {"email": "laurensiusyuda76@gmail.com", "password": "Password3!"},
  ];

  // * Function login
  Future<void> onLogin() async {
    try {
      if (formKey.currentState!.validate()) {
        EasyLoading.show(status: 'loading...');
        String email = emailFC.text;
        String password = passwordFC.text;
        isValidUser.value = false;
        for (var user in dummyUsers) {
          if (user['email'] == email && user['password'] == password) {
            isValidUser.value = true;
            break;
          }
        }
        await Future.delayed(
          const Duration(seconds: 5),
        );
        EasyLoading.dismiss();
        if (isValidUser.value) {
          StorageUtil.writeBool('isLoggedIn', true);
          await Get.toNamed(AppPages.home);
        } else {
          Get.snackbar('Error', 'Email atau password salah',
              snackPosition: SnackPosition.BOTTOM);
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  // * function logout
  void logout() {
    StorageUtil.writeBool('isLoggedIn', false);
    Get.offAllNamed(AppPages.login);
  }
}
