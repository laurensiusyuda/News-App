import 'package:dummy_project_1/modules/auth/controllers/auth_controller.dart';
import 'package:dummy_project_1/modules/auth/widgets/register/register_bottom.dart';
import 'package:dummy_project_1/modules/auth/widgets/register/register_form.dart';
import 'package:dummy_project_1/modules/auth/widgets/register/register_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 80, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKeyRegister,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderScreenRegister(),
                SizedBox(height: 10),
                RegisterForm(),
                SizedBox(height: 30),
                RegisterBottom(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
