import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  final String title;
  final Icon? icons;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  const TextFieldWidget({
    super.key,
    this.icons,
    required this.title,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(2),
      child: TextFormField(
        validator: validator,
        controller: controller,
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

class TextFieldWidgetPassword extends StatelessWidget {
  final String title;
  final Icon? icons;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final IconButton? suffixIcon;
  final bool obscureText;

  const TextFieldWidgetPassword({
    super.key,
    required this.obscureText,
    required this.title,
    this.icons,
    this.controller,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(2),
      child: TextFormField(
        obscureText: obscureText,
        validator: validator,
        controller: controller,
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
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
