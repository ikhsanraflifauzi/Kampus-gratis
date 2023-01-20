import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/themes/themes.dart';

class PanduanSecondCard extends StatelessWidget {
  final String? id;
  final String title;
  final String subtitle;
  final String? description;
  final String? url;
  final String? imageLink;
  final String? text;
  final String destination;
  final bool isbuku;

  const PanduanSecondCard({
    Key? key,
    this.id,
    required this.title,
    required this.subtitle,
    this.description,
    this.url,
    this.imageLink,
    this.text,
    required this.destination,
    required this.isbuku,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (destination == '/panduan/buku/detail') {
          Get.toNamed(
            destination,
            arguments: [id, title, description, imageLink, text],
          );
        }

        if (destination == '/panduan/kamus_kg/aplikasi') {
          Get.toNamed(
            destination,
            arguments: ['application', ''],
          );
        }

        if (destination == '/panduan/kamus_kg/kuliah') {
          Get.toNamed(
            destination,
            arguments: ['material', ''],
          );
        }
        Get.toNamed(destination);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: isbuku != true
              ? const Color(0xFF106FA4)
              : const Color(0xFF479A5E),
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          title: Text(
            title,
            style: Themes.lightTheme.textTheme.headline6!.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: const Color(0xFFFAFAFA),
            ),
          ),
          trailing: InkWell(
            onTap: () {},
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 28,
              color: Color(0xFFF3F3F3),
            ),
          ),
        ),
      ),
    );
  }
}
