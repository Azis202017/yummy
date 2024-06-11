import 'package:get/get.dart';
import 'package:yummy/app/services/receipe_service.dart';

import '../../../data/models/recipe.dart';
import '../../../data/models/user.dart';
import '../../../services/user_services.dart';

class HomeController extends GetxController {
  List<Recipe> recommendationRecipes = [];
  User? user;
  bool isLoading = true;
  @override
  void onInit() async{
    super.onInit();
    getUser();
   await getAllRecommendation();
  }
  
  Future<void> getAllRecommendation() async {
    isLoading= true;

    recommendationRecipes = await ReceipeService().getAllRecipe();
    isLoading = false;
    update();
  }
  void getUser() async {
    isLoading= true;
    user = await UserService().getUser();

    isLoading = false;

  }
}
