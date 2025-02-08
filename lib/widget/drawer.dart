import 'package:dummy_project_1/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final String currentRoute = Get.currentRoute;
    final String? arguments = Get.arguments as String?;

    int getInitialIndex() {
      if (currentRoute == AppPages.homeScreen) return 0;
      if (currentRoute == AppPages.bookmarkScreen) {
        if (arguments == 'trending_news') return 1;
        if (arguments == 'category_news') return 2;
      }
      return 0;
    }

    final SidebarXController sidebarController = SidebarXController(
      selectedIndex: getInitialIndex(),
      extended: false,
    );

    void navigateToScreen(String route, [String? arguments]) {
      // Close drawer first
      if (Scaffold.of(context).isDrawerOpen) {
        Navigator.of(context).pop();
      }

      // Then navigate
      Future.delayed(const Duration(milliseconds: 100), () {
        Get.offAllNamed(
          route,
          arguments: arguments,
        );
      });
    }

    return SidebarX(
      controller: sidebarController,
      theme: SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.transparent),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black.withOpacity(0.37)),
          color: Colors.grey.withOpacity(0.2),
        ),
        iconTheme: IconThemeData(
          color: Colors.black.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.black,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 240,
        decoration: BoxDecoration(color: Colors.white),
      ),
      items: [
        SidebarXItem(
          label: 'Home',
          icon: Icons.home,
          onTap: () => navigateToScreen(AppPages.homeScreen),
        ),
        SidebarXItem(
          icon: Icons.bookmark,
          label: 'Bookmarks Trending News',
          onTap: () =>
              navigateToScreen(AppPages.bookmarkScreen, 'trending_news'),
        ),
        SidebarXItem(
          icon: Icons.bookmark,
          label: 'Bookmarks By Category News',
          onTap: () =>
              navigateToScreen(AppPages.bookmarkScreen, 'category_news'),
        ),
      ],
    );
  }
}
