import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../themes/themes.dart';
import '../../../utils/colors_constans.dart';
import 'label_text_field.dart';

class PickContainer extends StatelessWidget {
  final String? fileName;
  final String? filePath;
  final String? fileNameObs;
  final String? labelTextField;
  final Function()? onTap;
  final Function()? onTapDelete;
  final String? data;
  final int? kategori;
  final Widget? download;
  const PickContainer(
      {super.key,
      this.fileName,
      this.filePath,
      this.onTap,
      this.fileNameObs,
      this.labelTextField,
      this.data,
      this.kategori,
      this.onTapDelete,
      this.download});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: Get.width * 0.6,
          height: 36,
          decoration: BoxDecoration(
            color: ColorConstants.greyTextField,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              InkWell(
                onTap: onTap,
                child: Container(
                  height: 36,
                  width: Get.width * 0.48,
                  margin: const EdgeInsets.only(left: 1, top: 1, bottom: 1),
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                  child: Text(
                    fileNameObs != ''
                        ? fileNameObs!
                        : fileName != null
                            ? fileName!
                            : "Pilih File",
                    style: fileNameObs != '' || fileName != null
                        ? Themes.lightTheme.textTheme.subtitle2!
                            .copyWith(fontSize: 12)
                        : Themes.darkTheme.textTheme.caption!
                            .copyWith(color: ColorConstants.greyTextField),
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                  ),
                ),
              ),
              InkWell(
                onTap: data != null ? onTapDelete : () {},
                child: Row(
                  children: [
                    SizedBox(
                      width: data != null ? 10 : 14,
                    ),
                    data != null
                        ? const Icon(
                            Icons.cancel,
                            size: 28,
                            color: Color(0xFF838383),
                          )
                        : SvgPicture.asset("assets/icons/directory_icons.svg"),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        download != null ? download! : const SizedBox(),
        Expanded(
          child: LabelTextField(
            label: labelTextField!,
          ),
        ),
      ],
    );
  }
}
