import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:get/get.dart';
import 'package:yummy/app/services/community_service.dart';

import '../../../data/models/community.dart';
import '../../../routes/app_pages.dart';
import '../controllers/community_controller.dart';

class CommunityView extends GetView<CommunityController> {
  const CommunityView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommunityController>(builder: (_) {
      return controller.isLoading
          ? const Material(
              child: Center(child: CircularProgressIndicator()),
            )
          : Scaffold(
              appBar: AppBar(
                title: const Text('Komunitas'),
                centerTitle: true,
              ),
              body: RefreshIndicator(
                onRefresh: () async {
                  controller.fetchCommunity();
                },
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: controller.communityList.length,
                  itemBuilder: (_, index) {
                    Community data = controller.communityList[index];
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.network(
                                        data.user?.fotoUrl ?? "",
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
                                      data.user?.name ?? "",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                PopupMenuButton<String>(
                                  icon: const Icon(Icons
                                      .more_vert), // Ikon yang digunakan untuk memicu menu popup
                                  onSelected: (String value) async{
                                   bool isLaporanSuccess =   await CommunityService().laporkan(id: data.id ?? 0);
                                   if(isLaporanSuccess) {
                                     Get.snackbar(
                                       "Berhasil",
                                       "Laporan berhasil",
                                       snackPosition: SnackPosition.BOTTOM,
                                       backgroundColor: Colors.green,
                                       duration: const Duration(seconds: 2),
                                     );
                                   }else {
                                     Get.snackbar(
                                       "Opss gagal melaporkan",
                                       "Coba ulangi lagi",
                                       snackPosition: SnackPosition.BOTTOM,
                                       backgroundColor: Colors.red,
                                       duration: const Duration(seconds: 2),
                                     );
                                   }
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return [
                                      const PopupMenuItem<String>(
                                        value: 'Laporkan',
                                        child: Text('Laporkan'),
                                      ),
                                      // Tambahkan item lainnya jika perlu
                                    ];
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              data.title ?? "",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Markdown(
                              shrinkWrap: true,
                              controller: ScrollController(),
                              data: data.description ?? "",
                              padding: EdgeInsets.zero,
                            ),
                            data.image == null
                                ? const SizedBox()
                                : ClipRRect(
                                    child: Image.network(
                                      data.fotoUrl ?? "",
                                      errorBuilder: (_, __, ___) {
                                        return Image.asset(
                                          "assets/images/logo.jpg",
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                          height: 300,
                                        );
                                      },
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      height: 200,
                                    ),
                                  ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.COMMENTAR, arguments: {
                                  "id": data.id,
                                  "title": data.title,
                                });
                              },
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.comment,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "${data.commentar?.length} Komentar",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
