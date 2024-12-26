import 'package:dummy_project_1/modules/auth/controllers/auth_controller.dart';
import 'package:dummy_project_1/modules/home/controllers/home_controller.dart';
import 'package:dummy_project_1/widget/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidebarx/sidebarx.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find();
    final HomeController controllerHome = Get.put(HomeController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Halaman HomePage",
          ),
          actions: [
            IconButton(
              onPressed: () {
                controller.onlogout();
              },
              icon: const Icon(
                Icons.logout_outlined,
              ),
            ),
          ],
        ),
        drawer: SidebarX(
          controller: SidebarXController(selectedIndex: 0, extended: false),
        ),
        // ! body page
        body: Obx(
          () {
            if (controllerHome.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (controllerHome.newsData.value?.articles == null) {
              return Center(
                child: Text(
                  'No news available',
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              );
            }
            return RefreshIndicator(
              onRefresh: () async {
                await controllerHome.getDataTopHeadlines();
              },
              child: ListView.builder(
                // * MENAMPILKAN SEMUA ITEM
                // itemCount: controllerHome.newsData.value!.articles!.length,

                // * MENAMPILKAN ITEM YANG HANYA MEMILIKI IMAGE
                itemCount: controllerHome.newsData.value?.articles
                        ?.where((article) => article.urlToImage != null)
                        .length ??
                    0,

                itemBuilder: (context, index) {
                  final filteredArticles = controllerHome
                      .newsData.value?.articles!
                      .where((article) => article.urlToImage != null)
                      .toList();

                  if (filteredArticles == null || filteredArticles.isEmpty) {
                    return const SizedBox.shrink();
                  }

                  final article = filteredArticles[index];

                  return ListCardWidget(
                    urlImage: '${article.urlToImage}',
                    title: '${article.title}',
                    description: '${article.description}',
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
