import 'package:flutter/material.dart';
import 'package:flutter_quick_note/services/register_services.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final formRegister = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();

  bool obsecurePass = true;
  bool obsecureConfirmPass = true;

  String selectedRole = "admin";

  void onObsecurePass({required int action}) {
    if (action == 10) {
      obsecurePass = !obsecurePass;
    } else {
      obsecureConfirmPass = !obsecureConfirmPass;
    }
    update();
  }

  void onChangeRole({required String value}) {
    selectedRole = value;
    update();
  }

  Future<bool> isEmailRegistered(String email) async {
    return await RegisterServices.checkEmailExists(email: email);
  }

  Future<void> registerAccount() async {
    bool emailExists = await isEmailRegistered(emailController.text);
    if (emailExists) {
      Get.snackbar("Error", "Email already registered");
      return;
    }

    bool result = await RegisterServices.fetchRegisterAccount(
        email: emailController.text,
        username: usernameController.text,
        password: passController.text,
        role: selectedRole);
    if (result) {
      Get.offAllNamed("/login");
    }
  }
}
