import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/auth_services.dart';

class LoginController extends GetxController {
 
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObsecure = true;
  void showPassword() {
    isObsecure = false;
    update();
  }
  void login() async {
    bool isSuccessLogin = await AuthService().login(email: emailController.text, password: passwordController.text);
    if (isSuccessLogin) {
      print("Login");
      // Get.offAllNamed('/home');
    }else {
      print("False");
    }
  }
}
