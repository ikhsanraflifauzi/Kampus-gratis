import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/themes/themes.dart';

class CardModul extends StatelessWidget {
  final List arguments;
  final String isDone;
  final int sessionNo;
  final int index;
  final String desc;
  final int videoCount;
  final int modulCount;
  const CardModul({
    Key? key,
    required this.arguments,
    required this.isDone,
    required this.sessionNo,
    required this.index,
    required this.desc,
    required this.videoCount,
    required this.modulCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: InkWell(
        onTap: () => Get.toNamed(
          '/studiku/modul/detail/',
          arguments: arguments,
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 35,
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              decoration: BoxDecoration(
                color: isDone == 'FINISHED'
                    ? const Color(0xFF3AAA35)
                    : Themes.lightTheme.primaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Text(
                'Pertemuan $sessionNo',
                style: Themes.lightTheme.textTheme.subtitle1!.copyWith(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Modul $index',
                    style: Themes.lightTheme.textTheme.headline5!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    desc,
                    style: Themes.lightTheme.textTheme.subtitle2!.copyWith(
                      fontSize: 10,
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Text(
                          '$videoCount Video dan $modulCount Modul Pdf',
                          style:
                              Themes.lightTheme.textTheme.subtitle1!.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: isDone == 'FINISHED'
                              ? const Color(0xFF3AAA35)
                              : const Color(0xFFFDB415),
                        ),
                        child: Text(
                          isDone == 'FINISHED' ? 'Selesai' : 'Lihat Modul',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color:
                                isDone == 'FINISHED' ? Colors.white : const Color(0xFF383838),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
