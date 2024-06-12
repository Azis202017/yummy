// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../data/models/commentar.dart' as commentar;
import '../data/models/community.dart';
import '../global/constanta.dart';

class CommunityService {
  Future<List<Community>> getCommunity() async {
    try {
      String uri = '/community';
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      Response response = await dio.get(uri);
      print(response.data);
      if (response.statusCode == 200) {
        List? data = response.data;
        if (data == null || data.isEmpty) {
          return [];
        } else {
          return data.map((e) => Community.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<bool> sendRecipe({
    required String title,
    required File foto,
    required String description,
  }) async {
    try {
      FormData formData = FormData.fromMap(
        {
          "title": title,
          "foto": await MultipartFile.fromFile(foto.path,
              filename: foto.path.split('/').last.toString()),
          "description": description,
        },
      );
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      var response = await dio.post("/community/create", data: formData);
      print(response.data);
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
 
  Future<bool> sendComment({
    required String title,
    required int id,
  }) async {
    try {
      FormData formData = FormData.fromMap(
        {
          "title": title,
         
          "community_id": id,
        },
      );
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      var response = await dio.post("/community/commentar", data: formData);
      print(response.data);
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
  Future<List<commentar.Commentar>> getCommentar(int id) async {
      String uri = '/community/comment/$id';
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      Response response = await dio.get(uri);
      if (response.statusCode == 200) {
        List? data = response.data['data'];
        if (data == null || data.isEmpty) {
          return [];
        } else {
          return data.map((e) => commentar.Commentar.fromJson(e)).toList();
        }
      }
      return [];
  }
}
