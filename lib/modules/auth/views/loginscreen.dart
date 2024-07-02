import 'package:dummy_project_1/modules/auth/controllers/login_controller.dart';
import 'package:dummy_project_1/modules/auth/widgets/login/login_bottom.dart';
import 'package:dummy_project_1/modules/auth/widgets/login/login_firebase.dart';
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
            key: controller.formKey,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // header login
                HeaderScreenLogin(),
                SizedBox(height: 10),
                // login WIth Api
                LoginForm(),
                SizedBox(height: 30),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  thickness: 2,
                  color: Colors.grey,
                ),
                SizedBox(height: 30),
                // Firebase Login
                LoginFirebase(),
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
