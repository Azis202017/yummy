// ignore_for_file: unnecessary_overrides, duplicate_ignore

import 'package:get/get.dart';

class TipsController extends GetxController {

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  // ignore: unnecessary_overrides
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
