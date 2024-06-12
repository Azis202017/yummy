import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yummy/app/data/models/tips.dart';

import '../global/constanta.dart';

class TipsService {
  Future<List<Tips>> getTips() async {
    try {
      String uri = '/tips';
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      Response response = await dio.get(uri);
      print(response.data);
      if (response.statusCode == 200) {
        List? data = response.data['data'];
        if (data == null || data.isEmpty) {
          return [];
        } else {
          return data.map((e) => Tips.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<bool> sendTips(
      {required String judul,
      required File foto,
      required String langkah,
     }) async {
    try {
      FormData formData = FormData.fromMap(
        {
          "judul": judul,
          "foto": await MultipartFile.fromFile(foto.path,
              filename: foto.path.split('/').last.toString()),
          "langkah_langkah": langkah,
        },
      );

      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      var response = await dio.post("/tips/add-tips", data: formData);
      print(response.data);

      if (response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
