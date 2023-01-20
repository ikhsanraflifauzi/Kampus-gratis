import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kampus_gratis/controllers/app_controller.dart';
import 'package:kampus_gratis/models/profile_model.dart';
import 'package:kampus_gratis/services/providers/profile_provider.dart';
import 'package:path/path.dart';

import '../../utils/colors_constans.dart';

class ProfilController extends GetxController with StateMixin<KGUserModel?> {
  final ProfileProvider _profileProvider;

  ProfilController(this._profileProvider);
  late TextEditingController nameController;
  Rx<String> userName = ''.obs;
  AppController appController = Get.find<AppController>();
  RxBool isNoConnection = false.obs;
  RxBool isLoading = false.obs;
  String? userRole;
  String? gender;
  String? selectedgender;
  var items = ['Laki - Laki', 'Perempuan'];

  final ImagePicker picker = ImagePicker();
  XFile? image;
  void pickImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    // if (image != null) {
    //   print(image!.name);
    //   print(image!.name.split(".").last);
    //   print("path ${image!.path}");
    // } else {
    //   print(image);
    // }
    update();
  }

  Future<void> fetchUserInfo() async {
    try {
      isLoading.value = true;
      change(null, status: RxStatus.loading());

      KGUserModel? user = await _profileProvider.getUser();
      final localStorage = GetStorage();
      userName.value = user?.fullName ?? '';
      if (user?.gender != null) setGender(items[int.parse(user!.gender!) - 1]);
      localStorage.write('role', user!.role);
      localStorage.write('student_id', user.studentId);
      isNoConnection.value = false;
      change(user, status: RxStatus.success());
      userRole = user.role;
      isLoading.value = false;
    } catch (error) {
      isLoading.value = false;

      if (error.toString().contains('No Connection')) {
        // Get.closeAllSnackbars();
        // Get.showSnackbar(const GetSnackBar(
        //   title: 'Error',
        //   message: 'Koneksi tidak tersedia',
        //   backgroundColor: Colors.red,
        //   animationDuration: Duration(milliseconds: 500),
        //   duration: Duration(seconds: 3),
        // ));
        isNoConnection.value = true;
      }
      change(null, status: RxStatus.error(error.toString()));
    }
  }

  Future<void> updateProfile() async {
    try {
      FormData body;
      body = FormData(
        {
          "full_name": nameController.text,
          "gender": selectedgender,
        },
      );
      var ext = extension(image!.path).substring(1);
      if (image != null) {
        body.files.add(MapEntry(
            'display_picture',
            MultipartFile(image!.path,
                contentType: 'image/$ext', filename: basename(image!.path))));
      }
      isLoading.value = true;
      await _profileProvider.updateUser(body);

      await Future.delayed(const Duration(seconds: 5));
      await fetchUserInfo();
      isLoading.value = false;
      Get.back();
      Get.snackbar("Berhasil", "Update profil");
    } catch (e) {
      var context = Get.context!;
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 1),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(20.0),
          content: Text(
            '$e',
            style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          backgroundColor: ColorConstants.red,
        ),
      );
    }
  }

  void setGender(String? value) {
    switch (value) {
      case 'Laki - Laki':
        selectedgender = '1';
        break;
      case 'Perempuan':
        selectedgender = '2';
        break;
      default:
        selectedgender = '0';
    }
    gender = value;
    update();
  }

  @override
  void onInit() async {
    await fetchUserInfo();
    nameController = TextEditingController(
        text: userName.value != '' ? userName.value : null);

    super.onInit();
  }
}
