import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/themes/themes.dart';

class PanduanCard extends StatelessWidget {
  const PanduanCard({
    Key? key,
    // required this.id,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.bgColor,
    this.url,
    this.imageLink,
    required this.destination,
  }) : super(key: key);

  // final String id;
  final String iconPath;
  final String title;
  final String subtitle;
  final Color bgColor;
  final String? url;
  final String? imageLink;
  final String destination;

//   final String id;
//   final String title;
//   final String description;
//   final IconData icon;
//   final String? url;
//   final String? imageLink;
//   final String? text;
//   final String destination;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Get.toNamed(destination);
        },
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: bgColor,
            // color: const Color(0xFF106FA4),
            boxShadow: const [
              BoxShadow(
                blurRadius: 2,
                offset: Offset(
                  0,
                  0.12,
                ),
              ),
            ],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(iconPath),
                ListTile(
                  title: Text(
                    '$title\n$subtitle',
                    style: Themes.lightTheme.textTheme.headline5!.copyWith(
                      color: const Color(0xFFFAFAFA),
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color(0xFFFAFAFA),
                    size: 28,
                  ),
                  contentPadding: const EdgeInsets.all(0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
