import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/panduan/panduan_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/views/panduan/components/panduan_card_.dart';
import 'package:kampus_gratis/views/panduan/components/panduan_popular_button.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';

class PanduanView extends GetView<PanduanController> {
  const PanduanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KGAppBar(
        backButton: true,
        title: 'Panduan',
        withIconKG: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: const [
                PanduanCard(
                  iconPath: 'assets/icons/panduan1.svg',
                  title: 'Buku',
                  subtitle: 'Panduan',
                  bgColor: Color(0xFF106FA4),
                  destination: '/panduan/buku',
                ),
                SizedBox(
                  width: 15,
                ),
                PanduanCard(
                  iconPath: 'assets/icons/panduan2.svg',
                  title: 'Video',
                  subtitle: 'Panduan',
                  bgColor: Color(0xFFF46963),
                  destination: '/panduan/video',
                ),
              ],
            ),
            const SizedBox(height: 15),
            const SizedBox(
              height: 150,
              child: PanduanCard(
                iconPath: 'assets/icons/panduan3.svg',
                title: 'Kampus',
                subtitle: 'Kampus Gratis',
                bgColor: Color(0xFF479A5E),
                destination: '/panduan/kamus_kg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Topik Populer',
                style: Themes.lightTheme.textTheme.headline5!.copyWith(
                  color: const Color(0xFF383838),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.4,
                ),
              ),
            ),
            const PanduanPopulerButton(
              content: 'Cara mendaftar di Kampus Gratis',
              destination: '',
            ),
            const PanduanPopulerButton(
              content: 'Cara mengisi Administrasi',
              destination: '',
            ),
            const PanduanPopulerButton(
              content: 'Cara mengakses fitur Studiku',
              destination: '',
            ),
            const PanduanPopulerButton(
              content: 'Cara melihat Nilai dan Sertifikat',
              destination: '',
            ),
          ],
        ),
      ),
    );
  }
}
