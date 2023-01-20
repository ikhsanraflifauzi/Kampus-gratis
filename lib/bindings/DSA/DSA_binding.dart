import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/DSA/DSA_controller.dart';

import 'package:kampus_gratis/services/providers/DSA/DSA_provider.dart';

import 'package:kampus_gratis/services/repository/DSA/DSA_repository.dart';

class DSABinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DSARepository(Get.find()));
    Get.lazyPut(() => DSAProvider(Get.find<DSARepository>()));
    Get.lazyPut(() => DSAController(Get.find<DSAProvider>()));
  }
}
