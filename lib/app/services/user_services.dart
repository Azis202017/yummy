// ignore_for_file: avoid_print


import 'dart:io';

import 'package:dio/dio.dart';
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
   Future<bool> editUser({
    required String email,
    required File foto,
    required String name,
    required String password,


  }) async {
    try {
      FormData formData = FormData.fromMap(
        {
          "email": email,
          "foto": await MultipartFile.fromFile(foto.path,
              filename: foto.path.split('/').last.toString()),
          "name": name,
          "password": foto,

        },
      );
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      var response = await dio.post("/user/edit", data: formData);
      print(response.data);
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
 
}