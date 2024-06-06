import 'package:get/get.dart';

import '../../home/views/home_view.dart';

class BottomNavbarController extends GetxController {
  int selectedIndex = 0;
  final listPage = [
    HomeView(),
    HomeView(),

  ];
  void changeIndex(int index) {
    selectedIndex = index;
    update();
  }
}
