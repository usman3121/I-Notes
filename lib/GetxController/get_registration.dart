import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getxstate_practice/Utils/utils.dart';
import '../routes/app_routes.dart';

class RegistrationController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  void login() {
    auth
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      Utils().toastMessage(value.user!.email.toString());
      emailController.clear();
      passwordController.clear();
      Get.offNamed(App_Routes.dashboard);
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
    });
  }

  void signUp() {
    auth
        .createUserWithEmailAndPassword(
          email: emailController.text.toString(),
          password: passwordController.text.toString(),

        )
        .then((value) => null)
        .onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
    });
  }

  void isLogin() {
    auth.userChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
        Get.offNamed(App_Routes.signIn);
      } else {
        debugPrint('User is signed in!');
        Utils().toastMessage("User is signed in!");
        Get.offNamed(App_Routes.dashboard);
      }
    }, onError: (error, stackTrace) {
      Utils().toastMessage(error.toString());
    });
  }
}
