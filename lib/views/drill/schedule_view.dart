import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/DSA/DSA_controller.dart';
import 'package:kampus_gratis/widgets/scaffold.dart';
import '../../widgets/app_bar.dart';
import 'package:flutter/material.dart';

class ScheduleDSAView extends GetView<DSAController> {
  const ScheduleDSAView({super.key});

  @override
  Widget build(BuildContext context) {
    return KGScaffold(
        backgroundColor: const Color(0xffF3F3F3),
        appBar: const KGAppBar(
          backButton: true,
          title: 'Jadwal DSA',
          withIconKG: true,
        ),
        body: controller.obx(
          (data) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 26, bottom: 24, left: 20, right: 20),
                    child: Container(
                      height: 170,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 75,
                            decoration: BoxDecoration(
                              color: const Color(0xffF3F3F3),
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      "https://picsum.photos/seed/picsum/200/50"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${data?[controller.indexNow.value].meetingType}',
                            style: const TextStyle(
                                color: Color(0XFF383838),
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          Text(
                            '${data?[controller.indexNow.value].topic}',
                            style: const TextStyle(
                                color: Color(0XFF383838),
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          const Text(
                            'Sales & Penjualan',
                            style: TextStyle(
                                color: Color(0XFF383838),
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 18,
                    color: const Color(0xffE5E5E5),
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 21),
                    child: Text(
                      'Pilih jadwal simulasi',
                      style: TextStyle(
                        color: Color(0XFF383838),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Obx(
                    () {
                      return SizedBox(
                        height: 350,
                        child: ListView.builder(
                          itemCount: controller.isChecked.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Checkbox(
                                  value: controller.isChecked[index],
                                  shape: const CircleBorder(),
                                  onChanged: (value) {
                                    controller.changeIsChaked(
                                      index,
                                      value!,
                                      data![controller.indexNow.value]
                                          .time[index]
                                          .toString(),
                                    );
                                  },
                                ),
                                Text(
                                  '${data?[controller.indexNow.value].time[index]}',
                                  style: const TextStyle(
                                    color: Color(0XFF383838),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
              GestureDetector(
                onTap: () async {
                  await controller
                      .submitSchedule(data![controller.indexNow.value].id);
                  Get.back();
                },
                child: Container(
                  height: 41,
                  width: 189,
                  margin: const EdgeInsets.only(bottom: 33),
                  decoration: BoxDecoration(
                    color: const Color(0xff106FA4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'Selesai',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
