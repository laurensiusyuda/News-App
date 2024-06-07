import 'package:dummy_project_1/modules/auth/controllers/login_controller.dart';
import 'package:dummy_project_1/modules/auth/widgets/header.dart';
import 'package:dummy_project_1/widget/button.dart';
import 'package:dummy_project_1/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validatorless/validatorless.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 80, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderScreenLogin(),
                const SizedBox(height: 5),
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
                const SizedBox(
                  height: 10,
                ),
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
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
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
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: ButtonWidget(
                    onPressed: controller.checkLogin(),
                    title: 'login',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
