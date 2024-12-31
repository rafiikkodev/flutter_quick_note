import 'package:flutter/material.dart';
import 'package:flutter_quick_note/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginControl = Get.find<LoginController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login Account",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            const Text(
              "Login with your email and password",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(
              height: 24,
            ),
            Form(
              key: loginControl.fromLogin,
              child: Column(
                children: [
                  TextFormField(
                    controller: loginControl.usernameController,
                    decoration: const InputDecoration(
                        labelText: "Username",
                        hintText: "Enter your username",
                        filled: true,
                        prefixIcon: Icon(Icons.person_rounded)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your required!";
                      }
                      return null;
                    },
                    maxLength: 20,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GetBuilder(
                      init: loginControl,
                      builder: (_) => TextFormField(
                            controller: loginControl.passController,
                            obscureText: loginControl.obsecurePass,
                            decoration: InputDecoration(
                                labelText: "Password",
                                hintText: "Enter your password",
                                filled: true,
                                prefixIcon: const Icon(Icons.password_rounded),
                                suffixIcon: GestureDetector(
                                  onTap: () => loginControl.onObsecurePass(),
                                  child: Icon(loginControl.obsecurePass
                                      ? Icons.visibility_off_rounded
                                      : Icons.visibility_rounded),
                                )),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter your Password!";
                              }
                              return null;
                            },
                            maxLength: 20,
                          )),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        print(loginControl.fromLogin.currentState!.validate());
                        if (loginControl.fromLogin.currentState!.validate()) {
                          loginControl.loginAccount();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      child: const Text("Login Now"),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/register');
                    },
                    child: const Text(
                      "Register Account",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.indigo,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
