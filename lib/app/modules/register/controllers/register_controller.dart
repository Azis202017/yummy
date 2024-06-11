import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../services/auth_services.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObsecure = true;
  void showPassword() {
    isObsecure = false;
    update();
  }

  void register() async {
    bool isSuccessRegister = await AuthService().register(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text);
    if (isSuccessRegister) {
      // print("Login");
      Get.offAllNamed(Routes.LOGIN);
    } else {
       Get.snackbar(
        "Error",
        "Email or password is wrong",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor:Colors.red,
      );
    }
  }
}
