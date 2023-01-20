import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/reset_password/change_password_controller.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
import 'package:kampus_gratis/widgets/primary_textfield.dart';

class ChangePasswordView extends GetView<ChangePassController> {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KGAppBar(
          backButton: true, title: 'Ubah Kata Sandi', withIconKG: false),
      backgroundColor: const Color(0xffF3F3F3),
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          children: [
            const Text(
              'Kata sandi saat ini',
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            const SizedBox(height: 4.0),
            PrimaryTextfield(
              controller: controller.currentpassC,
            ),

            // const Text('Kata sandi saat ini'),
            // TextField(
            //   controller: controller.currentpassC,
            //   autocorrect: false,
            //   decoration: const InputDecoration(
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Kata sandi baru',
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            const SizedBox(height: 4.0),
            PrimaryTextfield(
              controller: controller.newpassC,
            ),

            // const Text('Kata sandi baru'),
            // TextField(
            //   controller: controller.newpassC,
            //   autocorrect: false,
            //   decoration: const InputDecoration(
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Ulang Kata sandi baru',
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            const SizedBox(height: 4.0),
            PrimaryTextfield(
              controller: controller.confirmnewpassC,
            ),
            // const Text('Ulangi kata sandi baru'),
            // TextField(
            //   controller: controller.confirmnewpassC,
            //   autocorrect: false,
            //   decoration: const InputDecoration(
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),
            Obx(() => ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    minimumSize: const Size(150, 40)),
                onPressed: () {
                  if (controller.isLoading.isFalse) {
                    controller.updatePass();
                  }
                },
                child: Text(
                    controller.isLoading.isFalse ? "Kirim" : "Loading...")))
          ]),
      // body: SingleChildScrollView(
      //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 55),
      //   child:
      //       Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //     //  const Text(
      //     //     'E-mail Terkait',
      //     //     style: TextStyle(color: Colors.black),
      //     //   ),
      //     //   const SizedBox(
      //     //     height: 4.0,
      //     //   ),
      //     //   const SizedBox(
      //     //       height: 50.0,
      //     //       child: PrimaryTextfield(
      //     //         keyboardType: TextInputType.emailAddress,
      //     //       )),
      //     //   const SizedBox(
      //     //     height: 12.0,
      //     //   ),
      //     Text('Kata sandi saat ini'),
      //     const PrimaryTextfield(
      //       controller: controller.currentpassC,
      //     ),
      //     SizedBox(
      //       height: 15,
      //     ),
      //     const Text(
      //       'Kata sandi baru',
      //       style: TextStyle(color: Colors.black),
      //     ),
      //     const SizedBox(
      //       height: 4.0,
      //     ),
      //     PrimaryTextfield(
      //         onChanged: (value) {
      //           controller.cekPowerPass(value);
      //           // controller.passwordController;
      //           controller.newpassC,
      //         },
      //         obscureText: controller.passwordIsHidden.value,
      //         suffixIcon: IconButton(
      //           icon: controller.passwordIsHidden.value == true
      //               ? const Icon(Icons.visibility)
      //               : const Icon(Icons.visibility_off),
      //           onPressed: () {
      //             controller.passwordIsHidden.toggle();
      //           },
      //         )),
      //     const SizedBox(
      //       height: 5.0,
      //     ),
      //     const Text(
      //       '(Minimal 8 karakter dan gunakan kombinasi huruf dan angka)',
      //       style: TextStyle(
      //           color: Color(0xff106FA4),
      //           fontSize: 10,
      //           fontWeight: FontWeight.w700),
      //     ),
      //     Obx(
      //       () => controller.powerPass.value != 0
      //           ? Container(
      //               padding: const EdgeInsets.symmetric(vertical: 8.0),
      //               height: 25,
      //               child: ListView.separated(
      //                 scrollDirection: Axis.horizontal,
      //                 itemBuilder: (context, index) {
      //                   return SizedBox(
      //                     width: 25,
      //                     height: 10,
      //                     child: LinearProgressIndicator(
      //                       value: controller.powerPass.value,
      //                       color: Colors.transparent,
      //                       backgroundColor:
      //                           controller.powerPass.value <= 1 / 4
      //                               ? Colors.white
      //                               : controller.powerPass.value == 2 / 4
      //                                   ? ColorConstants.yellow1
      //                                   : controller.powerPass.value == 3 / 4
      //                                       ? ColorConstants.green1
      //                                       : ColorConstants.cyan1,
      //                     ),
      //                   );
      //                 },
      //                 separatorBuilder: (context, index) {
      //                   return const SizedBox(width: 2);
      //                 },
      //                 itemCount: 5,
      //               ),
      //             )
      //           : const SizedBox(),
      //     ),
      //     const SizedBox(height: 2),
      //     Obx(
      //       () => controller.powerPass.value != 0
      //           ? Padding(
      //               padding: const EdgeInsets.only(bottom: 15),
      //               child: Text(
      //                 controller.keterangan.value,
      //                 style: Themes.darkTheme.textTheme.titleSmall,
      //               ),
      //             )
      //           : const SizedBox(),
      //     ),
      //     const SizedBox(
      //       height: 12.0,
      //     ),
      //     const Text(
      //       'Ulangi kata sandi baru',
      //       style: TextStyle(color: Colors.black),
      //     ),
      //     const SizedBox(
      //       height: 4.0,
      //     ),
      //     const SizedBox(
      //         height: 50.0,
      //         child: PrimaryTextfield(
      //           controller: controller.confirmnewpassC,
      //           labelText: 'Kata sandi',
      //           keyboardType: TextInputType.emailAddress,
      //         )),
      //     const SizedBox(
      //       height: 32.0,
      //     ),
      //     PrimaryButton(
      //         color: Color(0xff106FA4),
      //         label: 'Kirim',
      //         onPressed: () {
      //           Get.defaultDialog(
      //               barrierDismissible: false,
      //               radius: 25,
      //               backgroundColor: Colors.white,
      //               title: ' ',
      //               content: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   Image.asset(
      //                     'assets/images/checkg.png',
      //                   ),
      //                   const SizedBox(
      //                     height: 28.0,
      //                   ),
      //                   Text(
      //                     'Kata sandi berhasil di ubah',
      //                     style: Themes.lightTheme.textTheme.titleLarge,
      //                   ),
      //                   const SizedBox(
      //                     height: 6.0,
      //                   ),
      //                   const Text(
      //                     'Silahkan masuk kembali untuk memulai pembelajaran',
      //                     textAlign: TextAlign.center,
      //                   ),
      //                   const SizedBox(
      //                     height: 45.0,
      //                   ),
      //                 ],
      //               ),
      //               actions: [
      //                 SizedBox(
      //                   height: 41.0,
      //                   child: ElevatedButton(
      //                     style: ElevatedButton.styleFrom(
      //                       backgroundColor: ColorConstants.blue2,
      //                       shape: RoundedRectangleBorder(
      //                         borderRadius: BorderRadius.circular(100.0),
      //                       ),
      //                     ),
      //                     onPressed: () {},
      //                     child: Text(
      //                       'Masuk kembali',
      //                       style: Themes.darkTheme.textTheme.titleMedium,
      //                     ),
      //                   ),
      //                 ),
      //                 const SizedBox(
      //                   height: 88.0,
      //                 ),
      //               ]);
      //         }),
      //   ]),
      // ));
    );
  }
}
