import 'package:dummy_project_1/modules/auth/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginFirebase extends StatelessWidget {
  const LoginFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());
    return Center(
      child: SignInButton(
        Buttons.googleDark,
        onPressed: () {
          controller.loginWithGoogle();
        },
      ),
    );
  }
}
