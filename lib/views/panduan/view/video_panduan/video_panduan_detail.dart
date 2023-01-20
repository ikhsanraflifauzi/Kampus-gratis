import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/panduan/panduan_video_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
import 'package:share_plus/share_plus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPanduanDetail extends GetView<PanduanVideoController> {
  const VideoPanduanDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !controller.isFullScreen.value
          ? const KGAppBar(
              backButton: true,
              title: 'Panduan Video',
              withIconKG: true,
            )
          : null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 230,
              child: ListView.separated(
                itemCount: 1,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 20);
                },
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    child: Column(
                      children: [
                        YoutubePlayerBuilder(
                          player: YoutubePlayer(
                            controller: YoutubePlayerController(
                              initialVideoId: Get.arguments[3],
                              flags: const YoutubePlayerFlags(
                                autoPlay: true,
                                mute: false,
                              ),
                            ),
                          ),
                          onEnterFullScreen: () {
                            controller.isFullScreen.value = true;
                          },
                          onExitFullScreen: () {
                            controller.isFullScreen.value = false;
                          },
                          builder: (context, player) {
                            return Column(
                              children: [
                                player,
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Panduan Pendaftaran',
                  style: Themes.lightTheme.textTheme.headline6!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Share.share(Get.arguments[4]);
                  },
                  child: SvgPicture.asset(
                    'assets/icons/share_icon.svg',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Deskripsi',
              style: Themes.lightTheme.textTheme.headline6!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              Get.arguments[2],
              style: Themes.lightTheme.textTheme.headline6!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Source: www.kampusgratis.com',
              style: Themes.lightTheme.textTheme.headline6!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
