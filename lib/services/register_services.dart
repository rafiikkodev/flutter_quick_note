import 'dart:io';

import 'package:dio/dio.dart';

class RegisterServices {
  static final Dio _dio = Dio();
  static const _baseurl = "http://10.0.2.2/aplikasi%20login";
  static const _login = "create_login.php";
  static const _checkEmail = "check_email.php";

  static Future<bool> fetchRegisterAccount(
      {required String email,
      required String username,
      required String password,
      required String role}) async {
    try {
      final response = await _dio.post("$_baseurl/$_login",
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }),
          data: FormData.fromMap({
            "email": email,
            "username": username,
            "password": password,
            "role": role,
          }));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> checkEmailExists({required String email}) async {
    try {
      final response = await _dio.post("$_baseurl/$_checkEmail",
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }),
          data: FormData.fromMap({
            "email": email,
          }));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['exists'];
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }
}
