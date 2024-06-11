import 'package:get/get.dart';

import '../controllers/commentar_controller.dart';

class CommentarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommentarController>(
      () => CommentarController(),
    );
  }
}
