import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yummy/app/data/models/user.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (_) {
      return controller.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              appBar: AppBar(
                title: const Text('Profile'),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                padding:const EdgeInsets.symmetric(horizontal:16,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: Stack(
                          children: [
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(200),
                                child: Image.network(
                                  controller.user?.fotoUrl ?? "",
                                  height: 200,
                                  width: 200,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) {
                                    return Image.asset("assets/images/logo.jpg",
                                        height: 200,
                                        width: 200,
                                        fit: BoxFit.cover);
                                  },
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                onPressed: controller.add,
                                icon: const CircleAvatar(
                                  child: Icon(
                                    Icons.edit,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    Center(
                      child: Text(
                        controller.user?.name ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Resep Saya",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: controller.user?.reseps?.length,
                      itemBuilder: (_, index) {
                        Resep data = controller.user?.reseps?[index] ?? Resep();
                        return Card(
                          color: Colors.white,
                          margin: const EdgeInsets.only(
                            top: 20,
                            bottom: 20,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.network(
                                        data.fotoResepUrl ?? "",
                                        errorBuilder: (_, __, ___) {
                                          return Image.asset(
                                            "assets/images/logo.jpg",
                                            width: 30,
                                            fit: BoxFit.cover,
                                            height: 30,
                                          );
                                        },
                                        width: 30,
                                        height: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      data.judulResep ?? "",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
    });
  }
}
