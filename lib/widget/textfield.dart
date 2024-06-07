import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  final String title;
  final Icon? icons;
  const TextFieldWidget({
    super.key,
    this.icons,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(2),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          hintText: title,
          hintStyle: GoogleFonts.nunito(
            textStyle: const TextStyle(color: Colors.grey),
          ),
          prefixIcon: icons,
        ),
      ),
    );
  }
}
