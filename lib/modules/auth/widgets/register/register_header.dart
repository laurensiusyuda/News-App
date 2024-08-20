import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderScreenRegister extends StatelessWidget {
  const HeaderScreenRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Daftar',
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
            'Selamat datang! Daftar sekarang dan nikmati akses penuh ke berita terbaru dan terpercaya.',
            style: GoogleFonts.nunito(
              textStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
