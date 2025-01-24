import 'package:dummy_project_1/modules/auth/controllers/auth_controller.dart';
import 'package:dummy_project_1/modules/home/controllers/home_controller.dart';
import 'package:dummy_project_1/widget/card.dart';
import 'package:dummy_project_1/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find();
    final HomeController controllerHome = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
        drawer: const CustomDrawer(),
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
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Berita Terkini',
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controllerHome.newsData.value?.articles
                              ?.where((article) => article.urlToImage != null)
                              .length ??
                          0,
                      itemBuilder: (context, index) {
                        final filteredArticles = controllerHome
                            .newsData.value?.articles!
                            .where((article) => article.urlToImage != null)
                            .toList();

                        if (filteredArticles == null ||
                            filteredArticles.isEmpty) {
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
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Lihat Lebih Banyak'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
