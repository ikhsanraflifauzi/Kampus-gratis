import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/themes/themes.dart';

class PanduanPopulerButton extends StatelessWidget {
  const PanduanPopulerButton({
    Key? key,
    required this.content,
    required this.destination,
  }) : super(key: key);

  final String content;
  final String destination;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(Get.width, 40)),
        backgroundColor: MaterialStateProperty.all(
          const Color(0xFFFAFAFA),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      child: Text(
        content,
        style: Themes.lightTheme.textTheme.headline5!.copyWith(
          color: const Color(0xFF383838),
          fontWeight: FontWeight.w500,
          fontSize: 12,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}
