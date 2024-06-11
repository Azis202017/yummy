import 'package:get/get.dart';

class ResepController extends GetxController {
  int activeWidget = 0; // Default widget yang aktif adalah 0 (Diajukan)

  void setActiveWidget(int index) {
    activeWidget = index;
    update();
  }
  void resep() {

  }
  
}
