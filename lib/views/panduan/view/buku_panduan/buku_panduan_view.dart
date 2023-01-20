import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/panduan/panduan_buku_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/views/panduan/components/panduan_second_card.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';

class BukuPanduan extends GetView<PanduanBukuController> {
  const BukuPanduan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KGAppBar(
        backButton: true,
        title: 'Panduan Buku',
        withIconKG: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Panduan',
              style: Themes.lightTheme.textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: const Color(0xFF383838),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Dalam panduan Buku ini menjelaskan tentang bagaimana menggunakan aplikasi kampus gratis langkah demi langkah.',
              style: Themes.lightTheme.textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            controller.obx(
              (data) => Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: data!.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 8,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return PanduanSecondCard(
                      id: data[index].id!,
                      title: data[index].title!,
                      subtitle: '',
                      description: data[index].description!,
                      destination: '/panduan/buku/detail',
                      imageLink: data[index].content!.imageLink!,
                      text: data[index].content!.text!,
                      isbuku: true,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
