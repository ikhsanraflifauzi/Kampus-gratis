import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kampus_gratis/utils/constants.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';

class PengaturanView extends StatelessWidget {
  const PengaturanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const KGAppBar(
          backButton: true,
          withIconKG: true,
          title: 'Pengaturan',
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
            child: Column(
              children: [
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(
                    "assets/icons/icon_mode_layar.svg",
                    width: 24,
                    fit: BoxFit.fitWidth,
                  ),
                  title: const Text("Mode Layar"),
                ),
                const SizedBox(
                  height: kSpacing,
                ),
                ListTile(
                  onTap: () {},
                  leading: Image.asset(
                    "assets/icons/google.png",
                    width: 24,
                    fit: BoxFit.fitWidth,
                  ),
                  title: const Text("Akun Terhubung"),
                ),
                // Row(
                //   children: [
                //     Image.asset('assets/icons/google.png'),
                //     Text("Akun Terhubung")
                //   ],
                // )
              ],
            )
            // Column(children: [
            //   Row(
            //     children: [
            //       SvgPicture.asset('assets/icons/icon_mode_layar.svg'),
            //       const Text('Mode')
            //     ],
            //   )
            // ]),
            ));
  }
}
