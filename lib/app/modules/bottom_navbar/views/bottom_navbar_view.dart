import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yummy/app/modules/kreasiku/controllers/kreasiku_controller.dart';

import '../../community/controllers/community_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../profile/controllers/profile_controller.dart';
import '../../theme/theme.dart';
import '../controllers/bottom_navbar_controller.dart';

class BottomNavbarView extends GetView<BottomNavbarController> {
  const BottomNavbarView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavbarController>(builder: (_) {
      Get.put(HomeController());
      Get.put(BottomNavbarController());

      Get.put(KreasikuController());
      Get.put(CommunityController());
      Get.put(ProfileController());

      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor:
              AppColors.white, // Sesuaikan dengan warna latar belakang Anda
          selectedItemColor: AppColors.oren,
          unselectedItemColor: Colors.grey[300],
          currentIndex: controller.selectedIndex,
          selectedFontSize:
              14.0, // Sesuaikan dengan ukuran font yang Anda inginkan
          unselectedFontSize:
              14.0, // Sesuaikan dengan ukuran font yang Anda inginkan
          onTap: controller.changeIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_text_fill),
              label: 'Komunitas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Tambah Resep',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
        body: controller.listPage.elementAt(controller.selectedIndex),
      );
    });
  }
}
