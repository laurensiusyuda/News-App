import 'package:dummy_project_1/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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
    final HomeController controller = Get.find();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: elevation,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
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
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: Obx(
                      () => AnimatedScale(
                        scale: controller.isBookmarked(title) ? 1.2 : 1.0,
                        duration: const Duration(milliseconds: 200),
                        child: IconButton(
                          onPressed: () {
                            controller.toggleBookmarks(title);
                            HapticFeedback.lightImpact();
                            Get.defaultDialog(
                              title: 'Bookmark',
                              middleText: controller.isBookmarked(title)
                                  ? 'Tambahkan Ke Favorite'
                                  : 'Hapus Dari Favorite',
                              titleStyle: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              middleTextStyle: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            controller.isBookmarked(title)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: controller.isBookmarked(title)
                                ? Colors.red
                                : Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
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
