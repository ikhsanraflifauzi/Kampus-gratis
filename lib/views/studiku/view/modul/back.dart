import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/widgets/primary_button.dart';
import '../../../../controllers/studiku/modul_controller.dart';

class ModulReview extends GetView<ModulController> {
  const ModulReview({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Themes.lightTheme.backgroundColor,
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: AppBar(
              backgroundColor: const Color(0xff106FA4),
              leading: IconButton(
                onPressed: () async {
                  Get.back();
                },
                icon: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'Modul ',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              actions: [
                Image.asset('assets/images/LOGO-01.png'),
              ],
            ),
          ),
          body: controller.obx((state) {
            return ListView(children: [
              Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Apa yang sudah kamu pelajari dari modul yang sudah diberikan?',
                      style: Themes.lightTheme.textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextFormField(
                          controller: controller.takeawayController,
                          expands: true,
                          keyboardType: TextInputType.multiline,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            hintText: 'Tuliskan Catatan Disini',
                            hintStyle: TextStyle(),
                            border: OutlineInputBorder(),
                          ),
                          minLines: null,
                          maxLines: null,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Minimal 500 Karakter',
                      style: Themes.lightTheme.textTheme.caption,
                    ),
                    PrimaryButton(label: 'Selesai', onPressed: () {})
                  ],
                ),
              ),
            ]);
          })),
    );
  }
}
