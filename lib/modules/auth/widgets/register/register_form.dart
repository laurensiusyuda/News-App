import 'package:dummy_project_1/modules/auth/controllers/auth_controller.dart';
import 'package:dummy_project_1/widget/button.dart';
import 'package:dummy_project_1/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:validatorless/validatorless.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldWidget(
          controller: controller.emailRegisterFC,
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
            obscureText: controller.showPasswordRegister.value,
            title: 'Masukan Password',
            controller: controller.passwordRegisterFc,
            icons: const Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              onPressed: () {
                controller.showPasswordRegister.toggle();
              },
              icon: Icon(
                controller.showPasswordRegister.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Colors.black,
              ),
            ),
            validator: Validatorless.multiple(
              [
                Validatorless.required('Silahkan Masukan Password'),
                Validatorless.min(8, 'Minimal 8 Karakter')
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Obx(
          () => TextFieldWidgetPassword(
            obscureText: controller.showPasswordConfirmRegister.value,
            title: 'Konfirmasi Password',
            controller: controller.confirmPasswordFc,
            icons: const Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              onPressed: () {
                controller.showPasswordConfirmRegister.toggle();
              },
              icon: Icon(
                controller.showPasswordConfirmRegister.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Colors.black,
              ),
            ),
            validator: Validatorless.multiple(
              [
                Validatorless.required(
                    'Silahkan Masukan Password Konfirmasi Password'),
                Validatorless.compare(controller.passwordRegisterFc,
                    'Konfirmasi Password Tidak Sama'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 35),
        Center(
          child: ButtonWidget(
            onPressed: () {
              controller.onRegister();
            },
            title: 'Register',
          ),
        ),
        const SizedBox(height: 30),
        const Divider(
          indent: 20,
          endIndent: 20,
          thickness: 2,
          color: Colors.grey,
        ),
        const SizedBox(height: 30),
        Center(
          child: SignInButton(
            Buttons.googleDark,
            onPressed: () {
              controller.loginWithGoogle();
            },
          ),
        ),
      ],
    );
  }
}
