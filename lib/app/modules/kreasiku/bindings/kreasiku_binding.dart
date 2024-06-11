import 'package:get/get.dart';

import '../controllers/kreasiku_controller.dart';

class KreasikuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KreasikuController>(
      () => KreasikuController(),
    );
  }
}
