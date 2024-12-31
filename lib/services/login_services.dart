import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_quick_note/model/user_model.dart';

class LoginServices {
  static final Dio _dio = Dio();
  static const _baseurl = "http://10.0.2.2/aplikasi%20login";
  static const _login = "cek_login.php";

  static Future<Map<String, dynamic>> fetchLoginAccount(
      {required String username, required String password}) async {
    try {
      final response = await _dio.post("$_baseurl/$_login",
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }),
          data: FormData.fromMap({
            "username": username,
            "password": password,
          }));
      if (response.statusCode == 200 || response.statusCode == 201) {
        dynamic data = jsonDecode(response.data);
        UserModel user = UserModel.fromJson(data["result"][0]);
        return {"status": true, "user": user};
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }
}
