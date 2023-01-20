import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/studiku/modul_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/views/studiku/components/card_modul.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
import 'package:kampus_gratis/widgets/shimmer_loading.dart';

class ModulView extends GetView<ModulController> {
  const ModulView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KGAppBar(
        backButton: true,
        title: 'Studi-Ku-Modul',
        withIconKG: true,
      ),
      body: controller.obx(
        (state) => ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          itemCount: controller.allDataModuleByIdSession.length,
          itemBuilder: (context, index) {
            return CardModul(
              arguments: [
                index + 1,
                Get.arguments[1],
                controller.allDataModuleByIdSession[index].description,
                controller.allDataModuleByIdSession[index].id,
                controller.allDataModuleByIdSession[index].status,
              ],
              isDone: controller.allDataModuleByIdSession[index].status,
              sessionNo: Get.arguments[1],
              index: index + 1,
              desc: controller.allDataModuleByIdSession[index].description,
              videoCount: controller
                  .allDataModuleByIdSession[index].contentLength.numberOfVideo,
              modulCount: controller.allDataModuleByIdSession[index]
                  .contentLength.numberOfDocument,
            );
          },
        ),
        onLoading: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              height: 150,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: const ShimmerLoading(),
            );
          },
          itemCount: 5,
        ),
        onError: (error) {
          return Container(
            height: Get.height,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 8,
            ),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Error.png',
                  fit: BoxFit.cover,
                  height: 100,
                  width: 200,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Text(
                    'Maaf sepertinya terdapat kesalahan $error, silahkan refresh halaman ini',
                    style: Themes.lightTheme.textTheme.headline6,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
