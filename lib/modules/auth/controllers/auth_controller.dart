// ignore_for_file: deprecated_member_use

import 'package:dummy_project_1/common/utils/utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:dummy_project_1/routes/pages.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  // login with firebase
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // formkey
  final GlobalKey<FormState> formKeylogin = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyForgotPassword = GlobalKey<FormState>();

  // login
  final TextEditingController emailFC = TextEditingController();
  final TextEditingController passwordFC = TextEditingController();

  // register
  final TextEditingController emailRegisterFC = TextEditingController();
  final TextEditingController passwordRegisterFc = TextEditingController();
  final TextEditingController confirmPasswordFc = TextEditingController();

  // forgot password
  final TextEditingController emailForgotPassword = TextEditingController();

  // toggel button
  final RxBool showPassword = true.obs;
  final RxBool showPasswordRegister = true.obs;
  final RxBool showPasswordConfirmRegister = true.obs;

  final RxBool emailVerify = false.obs;

  // * on register
  Future<void> onRegister() async {
    try {
      if (formKeyRegister.currentState!.validate()) {
        String email = emailRegisterFC.text;
        String password = passwordRegisterFc.text;
        EasyLoading.show(status: 'Loading...');
        UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (userCredential.user != null) {
          await userCredential.user!.sendEmailVerification();
          EasyLoading.dismiss();
          EasyLoading.showSuccess('Registrasi berhasil');
          Get.offAllNamed(
            AppPages.emailverify,
          );
          emailRegisterFC.clear();
          passwordRegisterFc.clear();
          confirmPasswordFc.clear();
        } else {
          EasyLoading.dismiss();
          EasyLoading.showError('Registrasi gagal: Kesalahan tidak diketahui');
        }
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
      rethrow;
    } finally {
      EasyLoading.dismiss();
    }
  }

  // * on send email verification
  Future<void> resendEmailVerification() async {
    try {
      EasyLoading.show(status: 'Loading...');
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        EasyLoading.dismiss();
        EasyLoading.showSuccess(
          'Email verifikasi telah dikirim ulang.',
          duration: const Duration(seconds: 2),
        );
        await user.sendEmailVerification();
      }
    } catch (e) {
      rethrow;
    } finally {
      EasyLoading.dismiss();
    }
  }

  // * on check email verification
  Future<void> checkEmailVerification() async {
    try {
      EasyLoading.show(status: 'Loading...');
      User? user = FirebaseAuth.instance.currentUser;
      await user?.reload();
      user = FirebaseAuth.instance.currentUser;
      emailVerify.value = false;
      if (user != null && user.emailVerified) {
        emailVerify.value = true;
        EasyLoading.dismiss();
        EasyLoading.showSuccess('Email sudah diverifikasi');
        Future.delayed(
          const Duration(seconds: 2),
          () {
            Get.offAllNamed(AppPages.home);
          },
        );
      } else {
        EasyLoading.dismiss();
        EasyLoading.showError('Email belum diverifikasi');
      }
    } catch (e) {
      rethrow;
    } finally {
      EasyLoading.dismiss();
    }
  }

  // * on forgot password
  Future<void> onForgotPassword() async {
    try {
      if (formKeyForgotPassword.currentState!.validate()) {
        EasyLoading.show(status: 'Loading...');
        String email = emailForgotPassword.text;
        List<String> signInMethods =
            await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
        if (signInMethods.isNotEmpty) {
          await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
          EasyLoading.dismiss();
          EasyLoading.showSuccess('Reset Password Berhasil',
              duration: const Duration(seconds: 2));
          Get.offAllNamed(AppPages.login);
          emailForgotPassword.clear();
        } else {
          EasyLoading.dismiss();
          EasyLoading.showError('Email tidak terdaftar. Silakan coba lagi.');
          emailForgotPassword.clear();
        }
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  // * on login
  Future<void> onLogin() async {
    try {
      if (formKeylogin.currentState!.validate()) {
        EasyLoading.show(status: 'loading...');
        await auth.signInWithEmailAndPassword(
          email: emailFC.text,
          password: passwordFC.text,
        );
        EasyLoading.dismiss();
        EasyLoading.showSuccess(
          'Login Berhasil',
          duration: const Duration(seconds: 2),
        );
        Get.offAllNamed(AppPages.home);
        emailFC.clear();
        passwordFC.clear();
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError('Login Gagal ${e.toString()}');
    } finally {
      EasyLoading.dismiss();
    }
  }

  // * on login with google
  Future<User?> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount == null) {
        cprint('Gagal Login');
        return null;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential authResult =
          await auth.signInWithCredential(credential);
      final User? user = authResult.user;
      if (user != null) {
        assert(!user.isAnonymous);
        assert(await user.getIdToken() != null);
        final User? currentUser = auth.currentUser;
        assert(user.uid == currentUser?.uid);
        Get.toNamed(AppPages.home);
      }
      return user;
    } catch (e) {
      rethrow;
    }
  }

  // * on logout
  Future<void> onlogout() async {
    try {
      await googleSignIn.signOut();
      await auth.signOut();
      EasyLoading.show(status: "Logging out...");
      Future.delayed(const Duration(seconds: 2), () {
        EasyLoading.dismiss();
        Get.offAllNamed(AppPages.login);
      });
    } catch (error) {
      cprint('Error logging out: $error');
      rethrow;
    }
  }
}