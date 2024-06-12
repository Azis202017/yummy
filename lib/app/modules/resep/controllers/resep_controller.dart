import 'package:get/get.dart';

import '../../../data/models/recipe.dart';
import '../../../services/receipe_service.dart';

class ResepController extends GetxController {
  int activeWidget = 0; // Default widget yang aktif adalah 0 (Diajukan)
  bool isLoading = true;
  List<Recipe> recipe = [];

  void setActiveWidget(int index) async {
    activeWidget = index;
    String status = "";
    if (activeWidget == 0) {
      status = "diajukan";
    } else if (activeWidget == 1) {
      status = "ditolak";
    } else if (activeWidget == 2) {
      status = "diupload";
    }
    recipe = await ReceipeService().getMyRecipe(status: "diajukan");
    
    update();
  }

  @override
  void onInit() {
    super.onInit();
    resep();
  }

  void resep() async {
    isLoading = true;

    recipe = await ReceipeService().getMyRecipe(status: "diajukan");
    isLoading = false;
    update();
  }
}
