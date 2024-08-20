import 'package:dummy_project_1/modules/auth/controllers/auth_controller.dart';
import 'package:dummy_project_1/modules/auth/widgets/login/login_bottom.dart';
import 'package:dummy_project_1/modules/auth/widgets/login/login_form.dart';
import 'package:dummy_project_1/modules/auth/widgets/login/login_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 80, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKeylogin,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderScreenLogin(),
                SizedBox(height: 10),
                LoginForm(),
                SizedBox(height: 30),
                LoginBottom(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
