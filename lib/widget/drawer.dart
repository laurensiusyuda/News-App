import 'package:dummy_project_1/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final SidebarXController sidebarController = SidebarXController(
      selectedIndex: 0,
      extended: false,
    );
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
          onTap: () {
            Get.offNamed(AppPages.home);
          },
        ),
        SidebarXItem(
          icon: Icons.bookmark,
          label: 'Bookmarks Item',
          onTap: () {
            Get.offNamed(AppPages.bookmarks);
          },
        ),
      ],
    );
  }
}
