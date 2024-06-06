import 'package:yummy/app/global/constanta.dart';

class AuthService {
  Future<bool> login({required String email, required String password}) async {
    try {
      final response =
          await dio.post('login', data: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> register(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final response = await dio.post('register',
          data: {'name': name, 'email': email, 'password': password});
      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }
}
