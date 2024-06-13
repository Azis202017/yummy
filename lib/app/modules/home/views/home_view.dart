import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yummy/app/data/models/recipe.dart';

import '../../../routes/app_pages.dart';
import '../../theme/theme.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return controller.isLoading
          ? const Material(child: Center(child: CircularProgressIndicator()))
          : Scaffold(
              body: RefreshIndicator(
                onRefresh: () async {
                  controller.getAllRecommendation();
                  controller.getUser();
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 24,
                    bottom: MediaQuery.of(context).padding.bottom + 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          "Halo ${controller.user?.name ?? ""}",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: AppColors.oren),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          "Mau masak apa hari ini?",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: TextField(
                          controller: controller.searchController,
                          onChanged: (value) {
                            controller.pencarian = value;
                            controller.update();
                          },
                          onEditingComplete: controller.search,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1.0,
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1.0,
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            hintText: "Cari disini",
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                        decoration: BoxDecoration(
                          color: AppColors.oren.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.info_outline),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "10 Rekomendasi makanan untuk kamu hari ini, anti bingung",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Text(
                                    "Lihat Resep",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                          color: AppColors.oren,
                                          decoration: TextDecoration.underline,
                                        ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Resep Rekomendasi",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text("Lihat Semua"),
                            )
                          ],
                        ),
                      ),
                      controller.recommendationRecipes.isEmpty
                          ? Center(
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/logo.jpg',
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text("Oppsss belum ada rekomendasi nih"),
                              ],
                            ))
                          : SizedBox(
                              height: 280,
                              child: GestureDetector(
                                child: ListView.separated(
                                  itemCount:
                                      controller.recommendationRecipes.length,
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  separatorBuilder: (_, __) {
                                    return const SizedBox(width: 16);
                                  },
                                  itemBuilder: (context, index) {
                                    final recipe =
                                        controller.recommendationRecipes[index];
                                    return GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                          Routes.DETAIL_RESEP,
                                          arguments: {
                                            'id': recipe.id,
                                          },
                                        );
                                        print(recipe.id,);
                                      },
                                      child: RecipeItem(
                                        recipe: recipe,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            );
    });
  }
}

class RecipeItem extends StatelessWidget {
  final Recipe recipe;
  const RecipeItem({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      width: 220,
      child: Stack(
        children: [
          Container(
            height: 280,
            width: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.network(recipe.fotoUrl ?? ""),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,

            /// make a glass effect
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              recipe.judulResep ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: Colors.white),
                              maxLines: 2,
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Icon(
                            Icons.bookmark_outline,
                            size: 20,
                            color: Colors.white,
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "${recipe.lamaMemasak} ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.white),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
