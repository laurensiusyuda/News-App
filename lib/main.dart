import 'package:dummy_project_1/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NewsApp',
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.pages,
    );
  }
}
