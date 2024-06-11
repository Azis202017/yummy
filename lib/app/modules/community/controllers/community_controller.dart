import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:yummy/app/data/models/community.dart';
import 'package:yummy/app/modules/widgets/custom_text_field.dart';
import 'package:yummy/app/services/community_service.dart';

class CommunityController extends GetxController {
  List<Community> communityList = [];
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  File? image;
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    fetchCommunity();
  }

  void fetchCommunity() async {
    communityList = await CommunityService().getCommunity();
    update();
    isLoading = false;
  }

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      update();
    }
  }

  void add() {
    Get.defaultDialog(
      title: "Tambah Komunitas",
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: title,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done,
              hint: "Masukkan judul",
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: description,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done,
              hint: "Masukkan Deskripsi",
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => pickImage(ImageSource.camera),
                  child: const Text('Kamera'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => pickImage(ImageSource.gallery),
                  child: const Text('Galeri'),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            GetBuilder<CommunityController>(
              builder: (controller) {
                return controller.image == null
                    ? const Text('No image selected.')
                    : Image.file(controller.image!);
              },
            ),
          ],
        ),
      ),
      textConfirm: 'OK',
      textCancel: 'Cancel',
      onConfirm: sendData
    );
  }

  void sendData() async {
    bool isCommunitySend = await CommunityService().sendRecipe(
        title: title.text,
        foto: image ?? File(image?.path ?? ""),
        description: description.text);
    if(isCommunitySend) {
      Get.back();
    fetchCommunity();

    }
  }
}
