// ignore_for_file: avoid_print

import 'package:get_storage/get_storage.dart';

import '../data/models/user.dart';
import '../global/constanta.dart';

class UserService {
  Future<User?> getUser() async {
    try{
      dio.options.headers['Authorization'] = "Bearer ${GetStorage().read("token")}";
      print(dio.options.headers['Authorization']);
      var response = await dio.get("/user");
      print(response.data);
      if(response.statusCode == 200) {
        return User.fromJson(response.data);
      }
      return null;
    }catch(e) {
      return null;
    }
  }
}