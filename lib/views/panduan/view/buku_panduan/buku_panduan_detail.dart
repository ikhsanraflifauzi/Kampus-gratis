import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/panduan/panduan_buku_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';

class BukuPanduanDetail extends GetView<PanduanBukuController> {
  const BukuPanduanDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KGAppBar(
        backButton: true,
        title: 'Panduan Buku',
        withIconKG: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              Get.arguments[1],
              style: Themes.lightTheme.textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: const Color(0xFF383838),
              ),
            ),
            Image.network(Get.arguments[3]),
            Text(
              Get.arguments[4],
              style: Themes.lightTheme.textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: const Color(0xFF383838),
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
