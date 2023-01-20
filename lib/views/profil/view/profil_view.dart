import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/login/login_controller.dart';
import 'package:kampus_gratis/controllers/profil/profil_controller.dart';
import 'package:kampus_gratis/utils/colors_constans.dart';
import 'package:kampus_gratis/utils/constants.dart';
import 'package:kampus_gratis/views/beranda/component/beranda_app_bar.dart';
import 'package:kampus_gratis/views/profil/component/profile_widget.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
import 'package:kampus_gratis/widgets/dialog.dart';
import 'package:kampus_gratis/widgets/scaffold.dart';

class ProfilView extends GetView<ProfilController> {
  ProfilView({Key? key}) : super(key: key);
  final LoginController _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return KGScaffold(
      appBar: AppBar(
        title: const Text(
          'Profil',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xffF3F3F3)),
        ),
        centerTitle: true,
        bottom: ProfilWidget(controller),
        backgroundColor: ColorConstants.mainBlue,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorConstants.mainBlue,
            statusBarBrightness: Brightness.dark),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Container(
            width: 30.0,
            margin: const EdgeInsets.only(right: 24.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/icons/Logo KG.png'),
                  fit: BoxFit.fitWidth),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return controller.fetchUserInfo();
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
          children: [
            ListTile(
              onTap: () {
                Get.toNamed('/data-diri');
              },
              leading: SvgPicture.asset(
                "assets/icons/icon_pendaftaran.svg",
                width: 24,
                fit: BoxFit.fitWidth,
              ),
              title: const Text("Pendaftaran"),
            ),
            const SizedBox(height: kSpacing1),
            ListTile(
              onTap: () {
                Get.toNamed("/nilai/list");
              },
              leading: SvgPicture.asset("assets/icons/icon_transkipnilai.svg"),
              title: const Text("Transkip Nilai"),
            ),
            const SizedBox(height: kSpacing1),
            ListTile(
              onTap: () => Get.toNamed('/keamanan'),
              leading: SvgPicture.asset("assets/icons/icon_keamanan.svg"),
              title: const Text("Keamanan"),
            ),
            const SizedBox(height: kSpacing1),
            ListTile(
              onTap: () => Get.toNamed('/pengaturan'),
              leading: SvgPicture.asset("assets/icons/icon_pengaturan.svg"),
              title: const Text("Pengaturan"),
            ),
            const SizedBox(height: kSpacing1),
            ListTile(
              onTap: () {},
              leading: SvgPicture.asset("assets/icons/icon_konsultasi.svg"),
              title: const Text("Konsultasi dan Layanan"),
            ),
            const SizedBox(height: kSpacing1),
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => KGDialog(
                    onConfirm: () {
                      _loginController.signOut();
                    },
                    onCancel: () {
                      Get.back();
                    },
                    filePath: 'assets/icons/exclamation_sign.svg',
                    title: "Yakin ingin keluar?",
                    middleText: "",
                    textConfirm: "Keluar",
                    textCancel: "Batal",
                  ),
                );
                // Get.defaultDialog(
                //     // actions: AssetImage('assets/images/alert.png'),
                //     title: "",
                //     middleText: "Yakin ingin keluar?",
                //     backgroundColor: Colors.white,
                //     middleTextStyle: TextStyle(color: Colors.black),
                //     textConfirm: "Keluar",
                //     textCancel: "Batal",
                //     cancelTextColor: Colors.black,
                //     confirmTextColor: Colors.black,
                //     buttonColor: Color(0xff106FA4),
                //     radius: 50,
                //     onConfirm: () {
                //       _loginController.signOut();
                //     },
                //     onCancel: () {
                //       Get.back();
                //     });
              },
              leading: SvgPicture.asset("assets/icons/icon_logout.svg"),
              title: const Text("Keluar"),
            ),
          ],
        ),
      ),
      bottomMenuIndex: 3,
    );
  }
}
