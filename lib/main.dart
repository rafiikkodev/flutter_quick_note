import 'package:flutter/material.dart';
import 'package:flutter_quick_note/modules/home/views/home_page.dart';
import 'package:flutter_quick_note/modules/login/bindings/login_binding.dart';
import 'package:flutter_quick_note/modules/login/views/login_page.dart';
import 'package:flutter_quick_note/modules/register/bindings/register_binding.dart';
import 'package:flutter_quick_note/modules/register/views/register_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Quick Note',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      initialRoute: "/login",
      getPages: [
        GetPage(
            name: "/login",
            page: () => const LoginPage(),
            binding: LoginBinding()),
        GetPage(
          name: "/home",
          page: () => const HomePage(),
        ),
        GetPage(
            name: "/register",
            page: () => const RegisterPage(),
            binding: RegisterBinding())
      ],
    );
  }
}
