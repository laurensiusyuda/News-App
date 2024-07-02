import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class HeaderScreenLogin extends StatelessWidget {
  const HeaderScreenLogin({super.key});

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
            'Masuk',
            style: GoogleFonts.nunito(
              textStyle: const TextStyle(
                fontSize: 26,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            'Tetap terinformasi dengan mudah. Masuk dan jelajahi dunia berita.',
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
