import 'package:get/get.dart';
import 'package:yummy/app/modules/kreasiku/views/kreasiku_view.dart';
import 'package:yummy/app/modules/profile/views/profile_view.dart';

import '../../community/views/community_view.dart';
import '../../home/views/home_view.dart';

class BottomNavbarController extends GetxController {
  int selectedIndex = 0;
  final listPage = [
    const HomeView(),
    const CommunityView(),
    const KreasikuView(),
    const ProfileView(),

  ];
  void changeIndex(int index) {
    selectedIndex = index;
    update();
  }
}
