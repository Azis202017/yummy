import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yummy/app/data/models/recipe.dart';

import '../global/constanta.dart';

class ReceipeService {
  Future<List<Recipe>> getAllRecipe() async {
    try {
      String url = '/resep';
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';

      Response response = await dio.get(
        url,
      );
      if (response.statusCode == 200) {
        List? data = response.data['data'];
        if (data == null || data.isEmpty) {
          return [];
        } else {
          return data.map((e) => Recipe.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
    Future<List<Recipe>> getMyRecipe({String? status}) async {
    try {
      String url = '/resep/find-my-recept?status=$status';
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';

      Response response = await dio.get(
        url,
      );
      print(response.data);
      if (response.statusCode == 200) {
        List? data = response.data['data'];
        if (data == null || data.isEmpty) {
          return [];
        } else {
          return data.map((e) => Recipe.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> sendRecipe(
      {required String judulResep,
      required File foto,
      required String lamaMemasak,
      required String caraMemasak,
      required String status}) async {
    try {
      FormData formData = FormData.fromMap(
        {
          "judul_resep": judulResep,
          "foto": await MultipartFile.fromFile(foto.path,
              filename: foto.path.split('/').last.toString()),
          "lama_memasak": lamaMemasak,
          "cara_memasak": caraMemasak,
          "status": "diajukan",
          
        },
      );

      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      var response = await dio.post("/resep/create", data: formData);
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
