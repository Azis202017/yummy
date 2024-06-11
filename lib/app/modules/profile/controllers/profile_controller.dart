import 'package:get/get.dart';

import '../../../data/models/user.dart';
import '../../../services/user_services.dart';


class ProfileController extends GetxController {
 User? user = User();
 bool isLoading = true;
 @override
  void onInit() {
    fetchUser();
    super.onInit();
  }
 void fetchUser() async{
  user = await UserService().getUser();
  isLoading = false;
  update();
 }
}
