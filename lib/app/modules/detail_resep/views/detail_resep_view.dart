import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_resep_controller.dart';

class DetailResepView extends GetView<DetailResepController> {
  const DetailResepView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailResepController>(builder: (context) {
      return controller.isLoading
          ? const Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SafeArea(
              child: Scaffold(
                body: Stack(
                  children: [
                    // Your background content
                    SizedBox(
                      width: double.infinity,
                      height: 360,
                      child: Image.network(
                        controller.detailFood?.fotoUrl ?? "",
                        fit: BoxFit.fill,
                        errorBuilder: (_, __, ___) {
                          return Image.asset("assets/images/logo.jpg",
                              fit: BoxFit.fill);
                        },
                      ),
                    ),
                    // DraggableScrollableSheet
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 68,
                        ),
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(32),
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                    DraggableScrollableSheet(
                      initialChildSize: 0.6,
                      minChildSize: 0.6,
                      builder: (
                        BuildContext context,
                        ScrollController scrollController,
                      ) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ), // Set the color you want
                          ),
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: SizedBox(
                                    width: 40,
                                    child: Image.asset(
                                      'assets/images/line.png',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Center(
                                  child: Text(
                                    controller.detailFood?.judulResep ?? "",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                const Text(
                                  'Cara Memasak',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      12,
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(
                                    16,
                                  ),
                                  child:  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(controller.detailFood?.caraMemasak ?? ""),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                 Text(
                                  'Lama memasak: ${controller.detailFood?.lamaMemasak} menit',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                               
                                const SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      12,
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(
                                    16,
                                  ),
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [],
                                  ),
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
