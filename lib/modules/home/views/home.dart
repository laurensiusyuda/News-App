import 'package:dummy_project_1/modules/auth/controllers/login_controller.dart';
import 'package:dummy_project_1/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find();

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                title: 'LogOut',
                onPressed: () {
                  controller.logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
