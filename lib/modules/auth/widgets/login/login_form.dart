import 'package:dummy_project_1/widget/button.dart';
import 'package:dummy_project_1/widget/textfield.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dummy_project_1/modules/auth/controllers/login_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validatorless/validatorless.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.find();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldWidget(
          controller: controller.emailFC,
          icons: const Icon(Icons.mail_outline_outlined),
          title: 'Masukan Email',
          validator: Validatorless.multiple(
            [
              Validatorless.required('Silahkan Masukan Email'),
              Validatorless.email('Masukkan Email Yang Valid'),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Obx(
          () => TextFieldWidgetPassword(
            obscureText: controller.showPassword.value,
            controller: controller.passwordFC,
            suffixIcon: IconButton(
              onPressed: () {
                controller.showPassword.toggle();
              },
              icon: Icon(
                controller.showPassword.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Colors.black,
              ),
            ),
            title: 'Password',
            icons: const Icon(Icons.lock_outline_rounded),
            validator: Validatorless.multiple(
              [
                Validatorless.required('Silahkan Masukan Password'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {},
                child: Text(
                  'Lupa Password',
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 25),
        Center(
          child: ButtonWidget(
            onPressed: () async {
              await controller.onLogin();
            },
            title: 'Login',
          ),
        ),
      ],
    );
  }
}
