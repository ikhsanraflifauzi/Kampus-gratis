import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/silabus/faculty_controller.dart';
import 'package:kampus_gratis/controllers/silabus/silabus_controller.dart';
import 'package:kampus_gratis/views/rencana_study/components/jurusan_card.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
import 'package:kampus_gratis/widgets/shimmer_loading.dart';

import '../../themes/themes.dart';

class MajorView extends GetView<SilabusController> {
  const MajorView({super.key});

  @override
  Widget build(BuildContext context) {
    final fControlller = Get.find<FacultyController>();
    return Scaffold(
      backgroundColor: const Color(0XFFf3f3f3),
      appBar: const KGAppBar(
        backButton: true,
        title: 'Rencana Studi',
        withIconKG: true,
      ),
      body: controller.obx(
        (data) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Text(
                'Pilihan Program Studi',
                style: Themes.lightTheme.textTheme.subtitle1!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Expanded(
              child: data!.isNotEmpty
                  ? ListView.builder(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 12),
                      itemCount: data.isNotEmpty ? data.length : 0,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              fControlller.checktStudentId(context, [
                                '${data[index].id}',
                                '${data[index].name}',
                                '${data[index].creditTotal}',
                                '${data[index].lecturer?.user?.fullName}., ${data[index].lecturer?.title?[0]}'
                              ]);
                              // Get.toNamed('/detail-jurusan', arguments: [
                              //   data[index].id,
                              //   data[index].name,
                              //   data[index].creditTotal,
                              //   '${data[index].lecturer?.user?.fullName}., ${data[index].lecturer?.title?[0]}'
                              // ]);
                            },
                            child: JurusanCard(
                              name: data[index].name ?? 'null',
                              description: data[index].description ?? 'null',
                              lecturerName:
                                  // data?[index].lecturer?.user?.fullName ??
                                  '${data[index].lecturer?.user?.fullName}., ${data[index].lecturer?.title?[0]}',
                              numberOfSubjects:
                                  // data?[index].numberOfSubjects ??
                                  data[index].creditTotal ?? '0',
                              thumbnailLink:
                                  data[index].thumbnailLink ?? 'null',
                            ),
                          ))
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 150,
                              width: 150,
                              child: Image.asset('assets/icons/Lainnya.png')),
                          const Text(
                            'Fakultas belum memiliki program studi',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
        onLoading: ListView.builder(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 12),
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 11),
              child: const ShimmerLoading(),
            );
          },
        ),
      ),
    );
  }
}
