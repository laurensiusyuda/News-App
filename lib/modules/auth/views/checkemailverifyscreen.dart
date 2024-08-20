import 'package:dummy_project_1/common/constant/directory_assest.dart';
import 'package:dummy_project_1/modules/auth/controllers/auth_controller.dart';
import 'package:dummy_project_1/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckEmailVerifSceen extends StatelessWidget {
  const CheckEmailVerifSceen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(top: 80, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Silahkan Check Email',
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Kami telah mengirimkan email verifikasi ke alamat email Anda.',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w700,
                  ),
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),
              Obx(
                () => Center(
                  child: Container(
                    child: controller.emailVerify.value
                        ? SvgPicture.asset(
                            height: 150,
                            DirectoryAssets.emailVerification,
                          )
                        : SvgPicture.asset(
                            height: 150,
                            DirectoryAssets.emailNotVerification,
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: ButtonWidget(
                  onPressed: () {
                    controller.checkEmailVerification();
                  },
                  title: 'Sudah Konfirmasi Email',
                ),
              ),
              const SizedBox(height: 100),
              Center(
                  child: InkWell(
                onTap: () {
                  controller.resendEmailVerification();
                },
                child: Text(
                  'Kirim Ulang Email Verifikasi',
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
