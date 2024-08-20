import 'package:dummy_project_1/modules/auth/controllers/auth_controller.dart';
import 'package:dummy_project_1/modules/auth/widgets/forgotpassword/forgot_form.dart';
import 'package:dummy_project_1/modules/auth/widgets/forgotpassword/forgot_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 80, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKeyForgotPassword,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderForgotLogin(),
                SizedBox(height: 10),
                ForgotForm(),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
