// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:dummy_project_1/common/utils/storage_util.dart';
import 'package:dummy_project_1/routes/pages.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  // Form key validator
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailFC = TextEditingController();
  final TextEditingController passwordFC = TextEditingController();

  final RxBool showPassword = true.obs;
  final RxBool isValidUser = false.obs;
  final RxBool isLoading = false.obs;

  // * login with firebase
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // * Dummy user
  final List<Map<String, String>> dummyUsers = [
    {"email": "laurensiusyuda87@gmail.com", "password": "Password2!"},
    {"email": "laurensiusyuda76@gmail.com", "password": "Password3!"},
  ];

  // * Future Register

  // * Function login
  Future<void> onLogin() async {
    try {
      if (formKey.currentState!.validate()) {
        EasyLoading.show(status: 'loading...');
        String email = emailFC.text;
        String password = passwordFC.text;
        isValidUser.value = false;
        for (var user in dummyUsers) {
          if (user['email'] == email && user['password'] == password) {
            isValidUser.value = true;
            break;
          }
        }
        await Future.delayed(
          const Duration(seconds: 5),
        );
        EasyLoading.dismiss();
        if (isValidUser.value) {
          StorageUtil.writeBool('isLoggedIn', true);
          await Get.toNamed(AppPages.home);
        } else {
          Get.snackbar('Error', 'Email atau password salah',
              snackPosition: SnackPosition.BOTTOM);
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  // * function logout
  void logout() {
    StorageUtil.writeBool('isLoggedIn', false);
    Get.offAllNamed(AppPages.login);
  }

  // * login with google
  Future<User?> loginWithGoogle() async {
    try {
      // Masuk dengan Google
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount == null) {
        // Jika pengguna membatalkan login dengan Google, kembalikan null
        return null;
      }

      // Autentikasi dengan Google
      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Masuk dengan Firebase
      final UserCredential authResult =
          await auth.signInWithCredential(credential);
      final User? user = authResult.user;

      if (user != null) {
        assert(!user.isAnonymous);
        assert(await user.getIdToken() != null);
        final User? currentUser = auth.currentUser;
        assert(user.uid == currentUser?.uid);

        // Arahkan ke tampilan home
        Get.toNamed(AppPages.home);
      }

      // Kembalikan pengguna yang masuk
      return user;
    } catch (e) {
      print('Login dengan Google gagal: $e');
      rethrow;
    }
  }

  Future<void> logoutGoogle() async {
    await googleSignIn.signOut();
    Get.back();
  }
}
