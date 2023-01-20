import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/acara_kampus/acara_controller.dart';
import 'package:kampus_gratis/services/providers/acara_kampus/acara_provider.dart';
import 'package:kampus_gratis/services/repository/acara_kampus/acara_repository.dart';

class AcaraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcaraController(Get.find<AcaraProvider>()));
    Get.lazyPut(() => AcaraProvider(Get.find<AcaraRepository>()));
    Get.lazyPut(() => AcaraRepository(Get.find()));
  }
}
