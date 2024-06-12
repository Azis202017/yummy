// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/resep_controller.dart';

class ResepView extends GetView<ResepController> {
  const ResepView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResepController>(builder: (context) {
      return controller.isLoading
          ? const Material(child: Center(child: CircularProgressIndicator()))
          : Scaffold(
              body: RefreshIndicator(
                onRefresh: () async => controller.resep(),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Wrap(
                        children: [
                          ClickableWidget(
                            isActive: controller.activeWidget == 0,
                            onTap: () {
                              // Implementasi ketika widget "Diajukan" ditekan
                              // Misalnya, panggil method controller atau lakukan operasi lainnya
                              // Contoh: controller.ajukanResep();
                              controller.setActiveWidget(0);
                              print(controller.activeWidget);
                            },
                            label: 'Diajukan',
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          ClickableWidget(
                            isActive: controller.activeWidget == 1,
                            onTap: () {
                              // Implementasi ketika widget "Ditolak" ditekan
                              // Misalnya, panggil method controller atau lakukan operasi lainnya
                              // Contoh: controller.tolakResep();
                              controller.setActiveWidget(1);
                              print(controller.activeWidget);
                            },
                            label: 'Ditolak',
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          ClickableWidget(
                            isActive: controller.activeWidget == 2,
                            onTap: () {
                              controller.setActiveWidget(2);
                              print(controller.activeWidget);
                            },
                            label: 'Diupload',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                          itemCount: controller.recipe.length,
                          primary: false,
                          shrinkWrap: true,
                          itemBuilder: (_, index) {
                            var data = controller.recipe[index];
                            return Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    data.fotoUrl ?? "",
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    height: 300,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 20,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(data.judulResep ?? ""),
                                        Text(data.caraMemasak ?? ""),
                                        Text("${data.lamaMemasak ?? ""} menit"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })
                    ],
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: controller.add,
                child: const Icon(Icons.add),
              ),
            );
    });
  }
}

class ClickableWidget extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;
  final String label;

  const ClickableWidget({
    required this.isActive,
    required this.onTap,
    required this.label,
    super.key, // perbaiki disini
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isActive ? Colors.orange : Colors.white,
          border: Border.all(color: Colors.orange),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
