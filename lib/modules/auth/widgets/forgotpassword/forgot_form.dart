import 'package:dummy_project_1/modules/auth/controllers/auth_controller.dart';
import 'package:dummy_project_1/widget/button.dart';
import 'package:dummy_project_1/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

class ForgotForm extends StatelessWidget {
  const ForgotForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.find();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldWidget(
          controller: controller.emailForgotPassword,
          icons: const Icon(Icons.mail_outline_outlined),
          title: 'Masukkan Email',
          validator: Validatorless.multiple(
            [
              Validatorless.required('Silahkan Masukan Email'),
              Validatorless.email('Masukkan Email Yang Valid'),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Center(
          child: ButtonWidget(
            onPressed: () {
              controller.onForgotPassword();
            },
            title: 'Reset Password',
          ),
        )
      ],
    );
  }
}
