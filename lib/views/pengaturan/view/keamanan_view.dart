import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/utils/constants.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';

class KeamananView extends StatelessWidget {
  const KeamananView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const KGAppBar(
          backButton: true,
          withIconKG: true,
          title: 'Keamanan',
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
          child: Column(children: [
            ListTile(
              onTap: () => Get.toNamed('/change-pass'),
              leading: SvgPicture.asset(
                "assets/icons/icon_change_pass.svg",
                width: 24,
                fit: BoxFit.fitWidth,
              ),
              title: const Text("Ubah Kata Sandi"),
            ),
            const SizedBox(
              height: kSpacing1,
            ),
            ListTile(
              onTap: () {},
              leading: SvgPicture.asset(
                "assets/icons/icon_izin_akses.svg",
                width: 24,
                fit: BoxFit.fitWidth,
              ),
              title: const Text("Izin Akses"),
            ),
          ]),
        ));
  }
}
