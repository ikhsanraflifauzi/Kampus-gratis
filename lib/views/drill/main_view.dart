import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/DSA/DSA_controller.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
import 'package:kampus_gratis/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:kampus_gratis/widgets/shimmer_loading.dart';

class MainDrillSimulasiAssigmentView extends GetView<DSAController> {
  const MainDrillSimulasiAssigmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KGScaffold(
        backgroundColor: const Color(0xffF3F3F3),
        appBar: const KGAppBar(
          backButton: true,
          title: 'DSA',
          withIconKG: true,
        ),
        body: RefreshIndicator(
          onRefresh: () async => controller.onRefresh(),
          child: controller.obx(
              (data) => ListView.separated(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: data?.length ?? 0,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        if (data?[index].status == false) {
                          Get.toNamed('/schedule/DSA');
                          controller.addSchedule(
                              data![index].time.length, index);
                        } else {}
                      },
                      child: Container(
                        height: 200,
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
                              '${data?[index].meetingType}',
                              style: const TextStyle(
                                  color: Color(0XFF383838),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            Text(
                              '${data?[index].topic}',
                              style: const TextStyle(
                                  color: Color(0XFF383838),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Sales & Penjualan',
                                  style: TextStyle(
                                      color: Color(0XFF383838),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                RotatedBox(
                                  quarterTurns: 2,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.arrow_back_ios_new_rounded,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16.0),
                  ),
              onEmpty: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      'Tidak ada data meeting',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: ColorConstants.gray200),
                    ),
                  ),
                ),
              ),
              onError: (error) => SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Terjadi kesalahan',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                color: ColorConstants.gray500),
                          ),
                          Text(
                            '$error',
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                color: ColorConstants.gray200),
                          ),
                        ],
                      ),
                    ),
                  ),
              onLoading: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (context, index) => ShimmerLoading(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16.0),
                itemCount: 8,
              )),
        )

        // SingleChildScrollView(
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
        //     child: Column(
        //       children: [
        //         Container(
        //           height: 200,
        //           width: double.infinity,
        //           decoration: BoxDecoration(
        //             color: Colors.white,
        //             borderRadius: BorderRadius.circular(8),
        //           ),
        //           padding: const EdgeInsets.symmetric(
        //             horizontal: 12,
        //             vertical: 16,
        //           ),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Container(
        //                 height: 75,
        //                 decoration: BoxDecoration(
        //                   color: const Color(0xffF3F3F3),
        //                   borderRadius: BorderRadius.circular(8),
        //                   image: const DecorationImage(
        //                       image: NetworkImage(
        //                           "https://picsum.photos/seed/picsum/200/50"),
        //                       fit: BoxFit.cover),
        //                 ),
        //               ),
        //               const SizedBox(
        //                 height: 5,
        //               ),
        //               const Text(
        //                 'Simulasi 1',
        //                 style: TextStyle(
        //                     color: Color(0XFF383838),
        //                     fontSize: 12,
        //                     fontWeight: FontWeight.w500),
        //               ),
        //               const SizedBox(
        //                 height: 1,
        //               ),
        //               const Text(
        //                 'Sales & Penjualan',
        //                 style: TextStyle(
        //                     color: Color(0XFF383838),
        //                     fontSize: 16,
        //                     fontWeight: FontWeight.w700),
        //               ),
        //               // const SizedBox(
        //               //   height: 1,
        //               // ),
        //               GestureDetector(
        //                 onTap: () {},
        //                 child: Container(
        //                   height: 10,
        //                   width: 10,
        //                   color: Colors.black,
        //                 ),
        //               ),
        //               GestureDetector(
        //                 onTap: () => print("tes"),
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     const Text(
        //                       'Sales & Penjualan',
        //                       style: TextStyle(
        //                           color: Color(0XFF383838),
        //                           fontSize: 12,
        //                           fontWeight: FontWeight.w500),
        //                     ),
        //                     RotatedBox(
        //                       quarterTurns: 2,
        //                       child: IconButton(
        //                         padding: EdgeInsets.zero,
        //                         constraints: const BoxConstraints(),
        //                         onPressed: () {},
        //                         icon: const Icon(
        //                           Icons.arrow_back_ios_new_rounded,
        //                         ),
        //                       ),
        //                     )
        //                   ],
        //                 ),
        //               ),
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}
