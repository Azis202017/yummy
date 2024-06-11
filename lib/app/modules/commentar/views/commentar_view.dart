import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_text_field.dart';
import '../controllers/commentar_controller.dart';

class CommentarView extends GetView<CommentarController> {
  const CommentarView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommentarController>(builder: (_) {
      return controller.isLoading
          ? const Material(child: Center(child: CircularProgressIndicator()))
          : Scaffold(
              appBar: AppBar(
                title: Text("${controller.title}"),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async => controller.fetchComment(),
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: controller.commentar.length,
                        itemBuilder: (_, index) {
                          var data = controller.commentar[index];
                          print(data);
                          return Card(
                            margin: const EdgeInsets.all(16), // Margin luar untuk Card
                            child: Padding(
                              padding: const EdgeInsets.all(16), // Padding dalam untuk Card
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(32),
                                        child: Image.network(
                                          data.user?.fotoUrl ?? "",
                                          width: 32,
                                          height: 32,
                                          errorBuilder: (_, __, ___) {
                                            return ClipRRect(
                                              borderRadius: BorderRadius.circular(18),
                                              child: Image.asset(
                                                'assets/images/logo.jpg',
                                                width: 32,
                                                height: 32,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 16), // Jarak horizontal antara gambar dan teks
                                      Text(
                                        data.user?.name ?? "",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8), // Jarak vertikal antara elemen dalam Card
                                  Text(
                                    data.title ?? "",
                                    style: const TextStyle(),
                                  ),
                                  const SizedBox(height: 16), // Jarak vertikal setelah teks
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16), // Jarak antara ListView dan FloatingActionButton
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    margin: const EdgeInsets.only(top: 16),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: controller.comment,
                            textInputType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            hint: "Masukkan komentar mu disini",
                          ),
                        ),
                        const SizedBox(width: 16), // Jarak horizontal antara text field dan tombol
                        ElevatedButton(
                          onPressed: controller.sendData,
                          child: const Icon(Icons.send),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
