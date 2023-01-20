import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
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
          appBar: KGAppBar(
              backButton: true,
              title: 'Modul ${Get.arguments[0]}',
              withIconKG: true),
          body: ListView(
            children: [
              Padding(
                  padding: const EdgeInsets.all(20.0),
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
                      Container(
                        height: 276,
                        width: Get.width,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextField(
                            enableSuggestions: true,
                            minLines: null,
                            maxLines: null,
                            expands: true,
                            maxLength: 500,
                            controller: controller.takeawayController,
                            keyboardType: TextInputType.multiline,
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Tuliskan Catatan Disini',
                              hintStyle: TextStyle(),
                            ),
                            textAlignVertical: const TextAlignVertical(y: -1.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 170),
                        child: Text(
                          'Minimal 500 Karakter',
                          style: Themes.lightTheme.textTheme.caption,
                        ),
                      ),
                      const SizedBox(
                        height: 158,
                      ),
                      PrimaryButton(
                          label: 'Selesai',
                          onPressed: () {
                            Get.back();
                            controller.finishModule(
                                controller.takeawayController.text, context);
                          })
                    ],
                  )),
            ],
          )),
    );
  }
}
