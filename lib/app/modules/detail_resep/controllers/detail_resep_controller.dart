import 'package:get/get.dart';
import 'package:yummy/app/data/models/detail_resep.dart';
import 'package:yummy/app/services/receipe_service.dart';

class DetailResepController extends GetxController {
  int food = Get.arguments['id'];

  DetailResep? detailFood = DetailResep();
  bool isLoading = true;
  @override
  void onInit() {
    super.onInit();
    getFoodId();
  }

  void getFoodId() async {
    print(food);
    // Proceed if id is successfully parsed or is already an int
    detailFood = await ReceipeService().getDetailResep(id: food);
    isLoading = false;
    update();
  }
}
