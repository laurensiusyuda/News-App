import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // * form key validator

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailFC = TextEditingController();
  TextEditingController passwordFC = TextEditingController();

  var showPassword = true.obs;

  List<Map<String, String>> dummyUsers = [
    {"email": "laurensiusyuda87@gmail.com", "password": "Password2!"},
    {"email": "laurensiusyuda76@gmail.com", "password": "Password3!"},
  ];

  Future<void> checkLogin() async {
    try {
      if (formKey.currentState!.validate()) {
      } else {}
    } catch (e) {
      rethrow;
    }
  }
}
