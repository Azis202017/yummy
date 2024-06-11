import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      initState: (_) {
        Timer.periodic(const Duration(seconds: 3), (timer) {
          Get.offAllNamed(Routes.LOGIN);
          timer.cancel();
        });
      },
      builder: (_) {
        return Scaffold(
          
          body: Center(
            child: Image.asset('assets/images/logo.jpg'),
          ),
        );
      },
    );
  }
}
