import 'package:flutter/material.dart';
import 'package:flutter_quick_note/services/login_services.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final fromLogin = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool obsecurePass = true;

  void onObsecurePass() {
    obsecurePass = !obsecurePass;
    update();
  }

  Future<void> loginAccount() async {
    Map<String, dynamic> result = await LoginServices.fetchLoginAccount(
      username: usernameController.text,
      password: passController.text,
    );
    if (result["status"]) {
      Get.offNamed("/home", arguments: {"data": result["user"]});
    }
  }
}
