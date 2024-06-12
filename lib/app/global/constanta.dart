import 'package:dio/dio.dart';

Dio dio = Dio(
  BaseOptions(
    baseUrl: "https://ae5d-180-242-70-170.ngrok-free.app/api/",
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
    },
    validateStatus: (statusCode) {
      return statusCode! <= 500; 
    },
  ),
);