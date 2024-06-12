// ignore_for_file: unnecessary_overrides, duplicate_ignore

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/models/tips.dart';
import '../../../services/tips_service.dart';
import '../../resep/controllers/resep_controller.dart';
import '../../widgets/custom_text_field.dart';

class TipsController extends GetxController {

  bool isLoading = true;
  List<Tips> tips = [];
  TextEditingController langkah = TextEditingController();
  TextEditingController judul = TextEditingController();


  File? image;
  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchTips();
  }

  void fetchTips() async {
    isLoading = true;

    tips = await TipsService().getTips();
    print(tips);
    isLoading = false;
    update();
  }

  void add() {
    Get.defaultDialog(
        title: "Tambah resep",
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                controller: judul,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
                hint: "Masukkan judul",
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: langkah,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
                hint: "Masukkan langkah-langkah",
              ),
              const SizedBox(
                height: 10,
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
              GetBuilder<TipsController>(
                builder: (controller) {
                  return controller.image == null
                      ? const Text('No image selected.')
                      : Image.file(
                          controller.image!,
                          height: 50,
                        );
                },
              ),
            ],
          ),
        ),
        textConfirm: 'OK',
        textCancel: 'Cancel',
        onConfirm: sendData);
  }

  void sendData() async {
    bool isCommunitySend = await TipsService().sendTips(
      judul: judul.text,
      langkah: langkah.text,
      foto: image ?? File(image?.path ?? ""),
    );
    if (isCommunitySend) {
      fetchTips();
      Get.back();
    } else {
      Get.defaultDialog(
        title: "Opss ada yang salah",
        content: const Text(
            "Check kembali apakah gambar yang dimasukkan kurang dari 2 mb atau isian data ada yang tidak terisi"),
      );
    }
  }
}
