import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/reset_password/change_password_controller.dart';

class ChangePasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePassController>(() => ChangePassController());
  }
}
