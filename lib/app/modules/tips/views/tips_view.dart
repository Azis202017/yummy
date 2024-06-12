import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tips_controller.dart';

class TipsView extends GetView<TipsController> {
  const TipsView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TipsController>(builder: (context) {
      return controller.isLoading
          ? const Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Scaffold(
              body: RefreshIndicator(
                onRefresh: () async {
                  controller.fetchTips();
                },
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: controller.tips.length,
                  itemBuilder: (_, index) {
                    var data = controller.tips[index];
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.judul ?? "",
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(data.langkahLangkah ?? ""),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
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
