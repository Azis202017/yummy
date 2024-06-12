import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/models/user.dart';
import '../../../services/user_services.dart';
import '../../community/controllers/community_controller.dart';
import '../../widgets/custom_text_field.dart';

class ProfileController extends GetxController {
  User? user = User();
  bool isLoading = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  File? image;
  TextEditingController passwordController = TextEditingController();
  bool isObsecure = true;
  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }

  void fetchUser() async {
    user = await UserService().getUser();
    isLoading = false;
    update();
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
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(

          title: const Text("Edit Profile"),
          content: Container(
            constraints: const BoxConstraints(
              maxHeight: 400, // Set a maximum height for the dialog
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    hint: "Masukkan email baru",
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: nameController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    hint: "Masukkan Nama",
                  ),
                  const SizedBox(height: 10),
                  GetBuilder<ProfileController>(
                    builder: (context) {
                      return CustomTextField(
                        controller: passwordController,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        isObscure: isObsecure,
                        onPressed: () {
                          isObsecure = !isObsecure;
                          context.update();
                        },
                        hint: "Masukkan Password",
                      );
                    },
                  ),
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 10),
                  GetBuilder<ProfileController>(
                    builder: (controller) {
                      return controller.image == null
                          ? const Text('No image selected.')
                          : Image.file(controller.image!);
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                sendData();
                Get.back(); // Close the dialog after sending data
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
      barrierDismissible:
          false, // Prevent dismissing the dialog by tapping outside
    );
  }

  void sendData() async {
    bool isProfileSend = await UserService().editUser(
      email: emailController.text,
      name: nameController.text,
      foto: image ?? File(image?.path ?? ""),
      password: passwordController.text,
    );
    if (isProfileSend) {
      Get.back();
      fetchUser();
    }
  }
}
