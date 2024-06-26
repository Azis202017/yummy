import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/commentar.dart';
import '../../../services/community_service.dart';

class DetailCommentController extends GetxController {
  var title = Get.arguments['title'];
  var id = Get.arguments['id'];
  bool isLoading = true;
  TextEditingController comment = TextEditingController();
  List<Commentar> commentar = [];

  @override
  void onInit() {
    fetchComment();
    super.onInit();
  }

  void sendData() async {
    bool isCommunitySend =
        await CommunityService().sendComment(title: comment.text, id: id);
    if (isCommunitySend) {
      Get.back();
      fetchComment();
    }
  }

  void fetchComment() async {
    commentar = await CommunityService().getCommentar(id);
    isLoading = false;
    update();
  }
}
