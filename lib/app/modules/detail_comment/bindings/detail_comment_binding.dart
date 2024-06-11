import 'package:get/get.dart';

import '../controllers/detail_comment_controller.dart';

class DetailCommentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailCommentController>(
      () => DetailCommentController(),
    );
  }
}
