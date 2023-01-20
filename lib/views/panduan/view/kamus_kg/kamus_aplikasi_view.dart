import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/panduan/panduan_kamus_kg_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';

class KamusAplikasi extends GetView<PanduanKamusKGController> {
  const KamusAplikasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KGAppBar(
        backButton: true,
        title:
            Get.arguments[0] == 'application' ? 'Kamus Aplikasi' : 'Glosarium',
        withIconKG: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: controller.searchController,
                onChanged: (value) {
                  if (value == '') {
                    controller.getAllPanduanKamus(
                      Get.arguments[0],
                      '',
                    );
                  } else {
                    controller.getAllPanduanKamus(
                      Get.arguments[0],
                      controller.searchController.text,
                    );
                  }
                },
                textAlignVertical: TextAlignVertical.center,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: 'Cari kata kunci ',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    height: 2.7,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.5,
                      color: Color(0xFF2995B2),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: controller.obx(
                (data) => ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ExpansionTile(
                          childrenPadding: const EdgeInsets.all(0),
                          title: Text(
                            '${data![index].word}',
                            style:
                                Themes.lightTheme.textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          children: [
                            ListTile(
                              title: Text(
                                '${data[index].definition}',
                                style: Themes.lightTheme.textTheme.bodyText2!
                                    .copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(thickness: 1.5),
                      ],
                    );
                  },
                  itemCount: data!.length,
                ),
                onEmpty: const Center(
                  child: Text('Tidak ada hasil pencarian'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
