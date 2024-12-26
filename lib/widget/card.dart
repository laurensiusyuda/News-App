import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListCardWidget extends StatelessWidget {
  // * HARUS DITAMBAHKAN ADALAH TITLE, DAN URL IMAGE
  final String title;
  final String urlImage;
  final double? elevation;
  final String? description;

  const ListCardWidget({
    super.key,
    this.elevation,
    this.description,
    // * HARUS DITAMBAHKAN ADALAH TITLE, DAN URL IMAGE
    required this.urlImage,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: elevation,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Image.network(
                urlImage,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    height: 200,
                    child: Center(
                      child: Icon(
                        Icons.error,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    title,
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description ?? '',
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
