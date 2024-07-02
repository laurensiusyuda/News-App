import 'package:dummy_project_1/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginBottom extends StatelessWidget {
  const LoginBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                AppPages.register;
              },
              child: Text(
                'Belum Memiliki Akun ?',
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
