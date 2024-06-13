import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/models/recipe.dart';
import '../../../services/receipe_service.dart';
import '../../widgets/custom_text_field.dart';

class ResepController extends GetxController {
  int activeWidget = 0; // Default widget yang aktif adalah 0 (Diajukan)
  bool isLoading = true;
  List<Recipe> recipe = [];
  TextEditingController caraMemasak = TextEditingController();
  TextEditingController judul = TextEditingController();
  TextEditingController lamaMemasak = TextEditingController();

  void setActiveWidget(int index) async {
    activeWidget = index;
    String status = "";
    if (activeWidget == 0) {
      status = "diajukan";
    } else if (activeWidget == 1) {
      status = "ditolak";
    } else if (activeWidget == 2) {
      status = "dipublikasikan";
    }
    recipe = await ReceipeService().getMyRecipe(status: status);

    update();
  }

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
    resep();
  }

  void resep() async {
    isLoading = true;

    recipe = await ReceipeService().getMyRecipe(status: "diajukan");
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
                controller: caraMemasak,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
                hint: "Masukkan cara memasak",
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: lamaMemasak,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
                hint: "Masukkan lama memasak",
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
              GetBuilder<ResepController>(
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
    bool isCommunitySend = await ReceipeService().sendRecipe(
      caraMemasak: caraMemasak.text,
      lamaMemasak: lamaMemasak.text,
      judulResep: judul.text,
      status: "diajukan",
      foto: image ?? File(image?.path ?? ""),
    );
    if (isCommunitySend) {
      resep();
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
