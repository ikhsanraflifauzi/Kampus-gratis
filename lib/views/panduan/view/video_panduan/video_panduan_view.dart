import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/panduan/panduan_video_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:kampus_gratis/views/panduan/components/panduan_second_card.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
import 'package:share_plus/share_plus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPanduan extends GetView<PanduanVideoController> {
  const VideoPanduan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KGAppBar(
        backButton: true,
        title: 'Panduan Video',
        withIconKG: true,
      ),
      body: controller.obx(
        (data) => ListView.separated(
          itemCount: data!.length + 1,
          padding: const EdgeInsets.all(16.0),
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 8,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Column(
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
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: const Color(0xFF383838),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              );
            }

            return InkWell(
              onTap: () {
                Get.toNamed(
                  '/panduan/video/detail',
                  arguments: [
                    data[index - 1].id,
                    data[index - 1].title,
                    data[index - 1].description,
                    data[index - 1].content!.url!.substring(32),
                    data[index - 1].content!.url,
                  ],
                );
              },
              child: Card(
                child: Column(
                  children: [
                    YoutubePlayerBuilder(
                      player: YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId:
                              data[index - 1].content!.url!.substring(32),
                          flags: const YoutubePlayerFlags(
                            autoPlay: false,
                            mute: false,
                            showLiveFullscreenButton: false,
                          ),
                        ),
                      ),
                      builder: (context, player) {
                        return Column(
                          children: [
                            player,
                          ],
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[index - 1].title!,
                            style:
                                Themes.lightTheme.textTheme.subtitle1!.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: const Color(0xFF383838),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data[index - 1].description!.substring(0, 20),
                                style: Themes.lightTheme.textTheme.subtitle1!
                                    .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: const Color(0xFF383838),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Share.share(data[index - 1].content!.url!);
                                },
                                child: SvgPicture.asset(
                                  'assets/icons/share_icon.svg',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
