import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
import '../../../../controllers/studiku/modul_controller.dart';
// import '../../../../controllers/studiku/session_controller.dart';

class ModulDetailView extends GetView<ModulController> {
  const ModulDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final cek = Get.find<SessionStudikuController>();
    controller.getDetailModuleById(Get.arguments[3]);
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: KGAppBar(
            backButton: true,
            title: 'Modul ${Get.arguments[0]}',
            withIconKG: true,
          ),
          body: Obx(
            () {
              if (controller.isLoading.isTrue) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                padding: const EdgeInsets.only(bottom: 16),
                children: [
                  Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Panduan",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Pada modul kali ini kita akan mempelajari basic dari ${Get.arguments[2]} diharapkan mahasiswa mampu mempelajari dengan baik, Berikut beberapa modul yang diberikan yaitu berupa modul Video dan Modul Pdf yang bisa kamu download",
                            overflow: TextOverflow.clip,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Modul Video",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 120,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: controller.detailModul.value != null
                                  ? controller.detailModul.value!.videos.length
                                  : 0,
                              itemBuilder: (context, index) {
                                final String? thumbnail =
                                    controller.getYoutubeThumbnail(controller
                                        .detailModul.value!.videos[index].url);
                                return SizedBox(
                                  width: 214,
                                  height: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(
                                            '/studiku/module_video',
                                            arguments: [
                                              controller.detailModul.value
                                                  ?.videos[index].title,
                                              controller.detailModul.value
                                                  ?.videos[index].description,
                                              controller.detailModul.value
                                                  ?.videos[index].url,
                                            ],
                                          );
                                        },
                                        child: Image(
                                          width: 214,
                                          height: 100,
                                          image: NetworkImage(thumbnail ?? ''),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Expanded(
                                        child: Text(
                                          controller.detailModul.value!
                                              .videos[index].title,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  width: 16,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Modul Pdf",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller
                                .detailModul.value?.documents.length
                                .compareTo(0),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    leading: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: controller.randomColor(),
                                          borderRadius:
                                              BorderRadius.circular(360)),
                                      child: Image.asset(
                                          'assets/icons/file-text.png'),
                                    ),
                                    title: Text(
                                        "${controller.detailModul.value?.documents[index].content}"),
                                    trailing: GestureDetector(
                                      onTap: () async {
                                        Get.snackbar(
                                          'Sedang Download',
                                          'Mohon Tunggu',
                                        );
                                        await controller.downloadDocument(
                                            controller.detailModul.value!
                                                .documents[index].link);
                                      },
                                      child: Image.asset(
                                        'assets/icons/download_hijau.png',
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                  ),
                                  controller.allDataModuleByIdSession[index]
                                              .status !=
                                          "NOT ENROLLED"
                                      ? const SizedBox()
                                      : ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              minimumSize: const Size(300, 40),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8))),
                                          onPressed: () {
                                            Get.defaultDialog(
                                              radius: 20,
                                              backgroundColor: Colors.white,
                                              title: '',
                                              content: Column(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Image.asset(
                                                        'assets/icons/peringatan_merah.png',
                                                        height: 40,
                                                        width: 40,
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      const Text(
                                                        "Sudah membaca modul?",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      const Padding(
                                                        padding: EdgeInsets.all(
                                                            12.0),
                                                        child: Text(
                                                          "Apakah kamu sudah benar-benar membaca atau menonton semua modul?",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                          maxLines: 3,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100)),
                                                            backgroundColor:
                                                                const Color(
                                                                    0xffE5E5E5),
                                                          ),
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                          child: const Text(
                                                              "Belum")),
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100)),
                                                          backgroundColor:
                                                              const Color(
                                                                  0xff106FA4),
                                                        ),
                                                        onPressed: () {
                                                          Get.toNamed(
                                                              'studiku/modul_review',
                                                              arguments: [
                                                                controller
                                                                    .takeawayController
                                                                    .value
                                                                    .text,
                                                              ]);
                                                          // Get.defaultDialog(
                                                          //   content: Container(
                                                          //     width: double.infinity,
                                                          //     height: Get.height,
                                                          //     padding: const EdgeInsets.symmetric(horizontal: 20,),
                                                          //     child: Column(
                                                          //       children: [
                                                          //         const SizedBox(
                                                          //           height: 20,
                                                          //         ),
                                                          //         Text(
                                                          //           'Apa yang sudah kamu pelajari dari modul yang sudah diberikan?',
                                                          //           style: Themes.lightTheme
                                                          //               .textTheme.subtitle1!
                                                          //               .copyWith(
                                                          //             fontWeight: FontWeight.w700,
                                                          //           ),
                                                          //         ),
                                                          //         const SizedBox(
                                                          //           height: 20,
                                                          //         ),
                                                          //         Container(
                                                          //           width: Get.width,
                                                          //           height: 276,
                                                          //           decoration: BoxDecoration(
                                                          //             borderRadius:
                                                          //                 BorderRadius.circular(
                                                          //                     8),
                                                          //           ),
                                                          //           child: TextFormField(
                                                          //             expands: true,
                                                          //             controller: controller
                                                          //                 .takeawayController,
                                                          //             keyboardType:
                                                          //                 TextInputType.multiline,
                                                          //             textAlign: TextAlign.center,
                                                          //             decoration:
                                                          //                 const InputDecoration(
                                                          //               hintText:
                                                          //                   'Tuliskan Catatan Disini',
                                                          //               hintStyle: TextStyle(),
                                                          //               border:
                                                          //                   OutlineInputBorder(),
                                                          //             ),
                                                          //             minLines: null,
                                                          //             maxLines: null,
                                                          //           ),
                                                          //         ),
                                                          //         const SizedBox(
                                                          //           height: 15,
                                                          //         ),
                                                          //         Expanded(
                                                          //           child: Text(
                                                          //             'Minimal 500 Karakter',
                                                          //             style: Themes.lightTheme
                                                          //                 .textTheme.caption,
                                                          //           ),
                                                          //         ),
                                                          //         PrimaryButton(
                                                          //           label: 'Selesai',
                                                          //           onPressed: () {
                                                          //             controller.finishModule(
                                                          //                 controller
                                                          //                     .takeawayController
                                                          //                     .text,
                                                          //                 context);
                                                          //           },
                                                          //         ),
                                                          //       ],
                                                          //     ),
                                                          //   ),
                                                          // );
                                                        },
                                                        child:
                                                            const Text("Sudah"),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                          child: const Text("Selesai")),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}
