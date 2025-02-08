import 'package:dummy_project_1/common/helper/datetimeformatter.dart';
import 'package:dummy_project_1/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ListCardWidgetbyTopHeadlines extends StatelessWidget {
  final String title;
  final String urlImage;
  final String description;
  final Function? onPressed;
  final double? elevation;

  const ListCardWidgetbyTopHeadlines({
    super.key,
    this.elevation,
    required this.description,
    this.onPressed,
    required this.urlImage,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: elevation,
        child: InkWell(
          onTap: onPressed as void Function()?,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                                title: title,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      description,
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
      ),
    );
  }
}

class CardWidgetbyCategory extends StatelessWidget {
  // ! menambahkan title description urltoimage
  final String title;
  final String description;
  final String publishAt;
  final String urlToImage;
  final Function? onPressed;
  const CardWidgetbyCategory({
    super.key,
    this.onPressed,
    required this.title,
    required this.description,
    required this.publishAt,
    required this.urlToImage,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: onPressed as void Function()?,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.92,
          child: Row(
            children: [
              Stack(
                children: [
                  Card(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Image.network(
                        urlToImage,
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width * 0.5,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.width * 0.35,
                            child: const Center(
                              child: Icon(Icons.error),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.01),
                        shape: BoxShape.circle,
                      ),
                      child: Obx(
                        () => AnimatedScale(
                          scale: controller.isBookmarkedbyCategory(title)
                              ? 1.2
                              : 1.0,
                          duration: const Duration(milliseconds: 200),
                          child: IconButton(
                            onPressed: () {
                              controller.loadtoggleBookmarksbyCategory(
                                controller.selectedCategory.value,
                                title,
                              );
                              HapticFeedback.lightImpact();
                              Get.defaultDialog(
                                title: title,
                                middleText:
                                    controller.isBookmarkedbyCategory(title)
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
                              controller.isBookmarkedbyCategory(title)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: controller.isBookmarkedbyCategory(title)
                                  ? Colors.red
                                  : Colors.black,
                              size: 28,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      (title.length > 20)
                          ? '${title.substring(0, 50)}...'
                          : title,
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: description.length > 20
                            ? '${description.substring(0, 20)}...'
                            : description,
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        children: [
                          if (description.length > 50)
                            TextSpan(
                              text: ' Read More',
                              style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      DateHelper().formatDate(
                        DateTime.parse(publishAt),
                      ),
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
