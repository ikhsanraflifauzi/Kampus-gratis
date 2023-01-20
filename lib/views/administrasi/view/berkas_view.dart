import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kampus_gratis/controllers/administrasi/berkas/berkas_controller.dart';
import 'package:kampus_gratis/views/administrasi/component/label_text_field.dart';
import 'package:kampus_gratis/views/administrasi/component/pick_container.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../themes/themes.dart';

class BerkasView extends GetView<BerkasController> {
  const BerkasView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Obx(() => Stack(
          children: <Widget>[
            Scaffold(
                backgroundColor: const Color(0xFFF3F3F3),
                appBar: AppBar(
                  backgroundColor: const Color(0xFF106FA4),
                  toolbarHeight: 72,
                  title: Text(
                    "Informasi Berkas",
                    style: Themes.darkTheme.textTheme.subtitle1!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  centerTitle: true,
                  leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                    iconSize: 24,
                  ),
                ),
                body: controller.obx(
                  (state) => Column(
                    children: [
                      Container(
                        height: 54,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                          child: LinearPercentIndicator(
                            backgroundColor: const Color(0xFFD9D9D9),
                            animation: true,
                            lineHeight: 11,
                            animateFromLastPercent: true,
                            animationDuration: 1000,
                            percent: 60 / 100,
                            barRadius: const Radius.circular(8),
                            progressColor: const Color(0xFF3AAA35),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GetBuilder<BerkasController>(
                          builder: (_) {
                            return SingleChildScrollView(
                              child: Form(
                                key: formKey,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const LabelTextField(label: "Foto KTP"),
                                      const SizedBox(height: 8),
                                      PickContainer(
                                        data: controller.ktp?.name,
                                        kategori: 0,
                                        fileName: controller.ktp?.name,
                                        fileNameObs:
                                            controller.ktpFileName.value,
                                        filePath: controller.ktp?.path,
                                        onTap: () async {
                                          if (controller.ktp?.name != null) {
                                            await controller
                                                .openFile(controller.ktp!.path);
                                          } else {
                                            await controller.pickFile(0);
                                          }
                                        },
                                        onTapDelete: () {
                                          controller.deleteFile(0);
                                        },
                                        labelTextField: ".jpeg, .jpg, .png",
                                      ),
                                      const SizedBox(height: 8),
                                      const LabelTextField(
                                          label: "Foto Ijazah Terakhir"),
                                      const SizedBox(height: 8),
                                      PickContainer(
                                        data: controller
                                            .lastCertificateDiploma?.name,
                                        fileName: controller
                                            .lastCertificateDiploma?.name,
                                        fileNameObs: controller
                                            .lastCertificateDiplomaFileName
                                            .value,
                                        filePath: controller
                                            .lastCertificateDiploma?.path,
                                        onTap: () async {
                                          if (controller.lastCertificateDiploma
                                                  ?.name !=
                                              null) {
                                            await controller.openFile(controller
                                                .lastCertificateDiploma!.path);
                                          } else {
                                            await controller.pickFile(3);
                                          }
                                        },
                                        onTapDelete: () {
                                          controller.deleteFile(5);
                                        },
                                        labelTextField: ".jpeg, .jpg, .png",
                                      ),
                                      const SizedBox(height: 8),
                                      const LabelTextField(
                                          label: "Kartu Keluarga"),
                                      const SizedBox(height: 8),
                                      PickContainer(
                                        data: controller.kk?.name,
                                        fileName: controller.kk?.name,
                                        fileNameObs:
                                            controller.kkFileName.value,
                                        filePath: controller.kk?.path,
                                        onTap: () async {
                                          if (controller.kk?.name != null) {
                                            await controller
                                                .openFile(controller.kk!.path);
                                          } else {
                                            await controller.pickFile(1);
                                          }
                                        },
                                        onTapDelete: () {
                                          controller.deleteFile(1);
                                        },
                                        labelTextField: ".jpeg, .jpg, .png",
                                      ),
                                      const SizedBox(height: 8),
                                      const LabelTextField(label: "Pas Foto"),
                                      const SizedBox(height: 8),
                                      PickContainer(
                                        data: controller.pasFoto?.name,
                                        fileName: controller.pasFoto?.name,
                                        fileNameObs:
                                            controller.fotoFileName.value,
                                        filePath: controller.pasFoto?.path,
                                        onTap: () async {
                                          if (controller.pasFoto?.name !=
                                              null) {
                                            await controller.openFile(
                                                controller.pasFoto!.path);
                                          } else {
                                            await controller.pickFile(2);
                                          }
                                        },
                                        onTapDelete: () {
                                          controller.deleteFile(3);
                                        },
                                        labelTextField: ".jpeg, .jpg, .png",
                                      ),
                                      const SizedBox(height: 8),
                                      const LabelTextField(
                                          label: "Sertifikat yang dimiliki"),
                                      const SizedBox(height: 8),
                                      PickContainer(
                                        data: controller.certificate?.name,
                                        fileName: controller.certificate?.name,
                                        fileNameObs: controller
                                            .certificateFileName.value,
                                        filePath: controller.certificate?.path,
                                        onTap: () async {
                                          if (controller.certificate?.name !=
                                              null) {
                                            await controller.openFile(
                                                controller.certificate!.path);
                                          } else {
                                            await controller.pickFilePdf(0);
                                          }
                                        },
                                        onTapDelete: () {
                                          controller.deleteFile(2);
                                        },
                                        labelTextField: ".pdf",
                                      ),
                                      const SizedBox(height: 8),
                                      const LabelTextField(
                                          label: "Transkip Nilai Terbaru"),
                                      const SizedBox(height: 8),
                                      PickContainer(
                                        data: controller.khs?.name,
                                        fileName: controller.khs?.name,
                                        fileNameObs:
                                            controller.khsFileName.value,
                                        filePath: controller.khs?.path,
                                        onTap: () async {
                                          if (controller.khs?.name != null) {
                                            await controller
                                                .openFile(controller.khs!.path);
                                          } else {
                                            await controller.pickFilePdf(1);
                                          }
                                        },
                                        onTapDelete: () {
                                          controller.deleteFile(4);
                                        },
                                        labelTextField: ".pdf",
                                      ),
                                      const SizedBox(height: 8),
                                      const LabelTextField(
                                          label: "Surat Pernyataan Orang Tua"),
                                      const SizedBox(height: 8),
                                      PickContainer(
                                        data: controller.parentStatement?.name,
                                        fileName:
                                            controller.parentStatement?.name,
                                        fileNameObs: controller
                                            .parentStatementFileName.value,
                                        filePath:
                                            controller.parentStatement?.path,
                                        onTap: () async {
                                          if (controller
                                                  .parentStatement?.name !=
                                              null) {
                                            await controller.openFile(controller
                                                .parentStatement!.path);
                                          } else {
                                            await controller.pickFilePdf(2);
                                          }
                                        },
                                        onTapDelete: () {
                                          controller.deleteFile(6);
                                        },
                                        download: Row(
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                Get.showSnackbar(
                                                  GetSnackBar(
                                                    messageText: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .downloading_rounded,
                                                          color: Colors.white,
                                                        ),
                                                        const SizedBox(
                                                            width: 13),
                                                        Text(
                                                          "Mengunduh Data",
                                                          style: Themes
                                                              .darkTheme
                                                              .textTheme
                                                              .caption!
                                                              .copyWith(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    margin: const EdgeInsets
                                                            .fromLTRB(
                                                        40, 0, 40, 60),
                                                    backgroundColor:
                                                        const Color(0xFF3AAA35),
                                                    duration: const Duration(
                                                        seconds: 2),
                                                    borderRadius: 8,
                                                  ),
                                                );

                                                await controller
                                                    .downloadDocument(controller
                                                        .parentStatementLink!);
                                              },
                                              child: Image.asset(
                                                'assets/icons/download_hijau.png',
                                                height: 25,
                                                width: 25,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                          ],
                                        ),
                                        labelTextField: ".pdf",
                                      ),
                                      Text(
                                        "Contoh Surat Pernyataan Orang Tua",
                                        style: Themes
                                            .lightTheme.textTheme.caption!
                                            .copyWith(color: Colors.red),
                                      ),
                                      Center(
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 41),
                                          height: 41,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (state?.files?.ninCard !=
                                                      null &&
                                                  state?.files?.familyCard !=
                                                      null &&
                                                  state?.files?.certificate !=
                                                      null &&
                                                  state?.files?.photo != null) {
                                                controller.putFiles();
                                              } else if (controller.ktp !=
                                                      null &&
                                                  controller.kk != null &&
                                                  controller.certificate !=
                                                      null &&
                                                  controller.pasFoto != null) {
                                                controller.putFiles();
                                              } else {
                                                Get.defaultDialog(
                                                    middleText:
                                                        'Berkas tidak boleh kosong');
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              fixedSize:
                                                  const Size.fromWidth(200),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              backgroundColor:
                                                  const Color(0xFF106FA4),
                                            ),
                                            child: Text(
                                              "Selanjutnya",
                                              style: Themes.darkTheme.textTheme
                                                  .subtitle2!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )),
            controller.isLoading.value
                ? Container(
                    height: Get.height,
                    width: Get.width,
                    color: Colors.black38,
                  )
                : const SizedBox()
          ],
        ));
  }
}
