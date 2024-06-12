import 'package:dio/dio.dart';

Dio dio = Dio(
  BaseOptions(
    baseUrl: "https://cb64-103-167-108-35.ngrok-free.app/api/",
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
    },
    validateStatus: (statusCode) {
      return statusCode! <= 500; 
    },
  ),
);