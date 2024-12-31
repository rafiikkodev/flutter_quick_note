import 'package:flutter_quick_note/modules/register/controllers/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put((RegisterController()));
  }
}
