import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/profil/profil_controller.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
import 'package:kampus_gratis/widgets/primary_textfield.dart';
import 'package:kampus_gratis/widgets/scaffold.dart';

class EditProfilView extends GetView<ProfilController> {
  EditProfilView({Key? key}) : super(key: key);
  final ProfilController _profilController = Get.find<ProfilController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        KGScaffold(
          appBar: const KGAppBar(
              backButton: true, title: "Edit Profil", withIconKG: false),
          body: _profilController.obx(
            (data) => ListView(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 56.0,
                    child: Stack(
                      children: [
                        controller.image == null
                            ? CircleAvatar(
                                radius: 48.0,
                                child: ClipOval(
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(48.0),
                                    child: data?.displayPictureLink != null
                                        ? Image.network(
                                            '${data?.displayPictureLink}',
                                            fit: BoxFit.cover,
                                          )
                                        : Image.asset(
                                            'assets/images/person2.png',
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                              )
                            : CircleAvatar(
                                radius: 48.0,
                                child: ClipOval(
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(48.0),
                                    child: Image.file(
                                      File(controller.image!.path),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                                onTap: (() {
                                  controller.pickImage();
                                }),
                                child: SvgPicture.asset(
                                    "assets/icons/edit_profil.svg"))),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32.0),
                const Text(
                  'Nama',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5.0),
                PrimaryTextfield(
                  withBorderSide: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  controller: controller.nameController,
                  hintText: 'Cth. Marsudi Cahyadi Pratama',
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Jenis kelamin',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5.0),
                GetBuilder<ProfilController>(
                    builder: (profileC) => InputDecorator(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 8.0),
                              fillColor: const Color(0xffFFFBFE),
                              filled: true),
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                            borderRadius: BorderRadius.circular(24.0),
                            isDense: true,
                            hint: const Text('Pilih jenis kelamin'),
                            value: profileC.gender,
                            isExpanded: true,
                            items: profileC.items
                                .map((value) => DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              profileC.setGender(value);
                            },
                          )),
                        )),
                const SizedBox(
                  height: 100,
                ),
                Obx(
                  () => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        minimumSize: const Size(150, 40)),
                    onPressed: controller.isLoading.value
                        ? () {}
                        : () async {
                            await controller.updateProfile();
                            await controller.fetchUserInfo();
                          },
                    child: controller.isLoading.value
                        ? const Text('Loading...')
                        : const Text("Simpan"),
                  ),
                ),
              ],
            ),
          ),
        ),
        Obx(() => controller.isLoading.value
            ? Container(
                color: Colors.black38,
                width: Get.width,
                height: Get.height,
                child:
                    const Center(child: CircularProgressIndicator.adaptive()),
              )
            : const SizedBox()),
      ],
    );
  }
}
