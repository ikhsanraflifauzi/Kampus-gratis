import 'dart:isolate';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kampus_gratis/models/studiku/assignment_detail_model.dart';
import 'package:kampus_gratis/services/providers/studiku/assignment_provider.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class AssignmentController extends GetxController
    with StateMixin<AssignmentDetailModel?> {
  final AssignmentProvider _assignmentProvider;
  ReceivePort port = ReceivePort();

  final quillController = QuillController.basic();
  final FocusNode focusNode = FocusNode();

  AssignmentController(
    this._assignmentProvider,
  );

  RxString filenameFromAPI = ''.obs;
  RxBool isLate = false.obs;
  RxBool isEmpty = true.obs;
  RxBool canEdit = false.obs;
  XFile? file;
  RxString fileName = ''.obs;
  RxBool isLoading = false.obs;

  getAssignmentById(String paramIdSession) async {
    try {
      var result = await _assignmentProvider.getAssignmentById(paramIdSession);
      var fileFromAPI =
          result?.studentsWork?.activityDetail?.fileAssignment != null
              ? XFile('${result?.studentsWork?.activityDetail?.fileAssignment}')
              : null;
      filenameFromAPI.value =
          fileFromAPI != null ? basename(fileFromAPI.path) : '';
      canEdit.value = !(filenameFromAPI.value != '');
      change(result, status: RxStatus.success());

      // final deadline = '${result?.assignment.duration}';
      // late(deadline);
      // final score = result?.studentsWork?.score;
      // String grade;
      // switch (score) {
      //   case 85 > 100:
      //     grade = 'A';
      //   case 85 > 100:
      //     grade = 'B';
      //     case 85 > 100:
      //     grade = 'C';
      //     case 85 > 100:
      //     grade = 'D';
      // }
      // return result;
      // if (result?.assignment != null) {
      //   return Assignment.fromJson(result?.assignment as Map<String, dynamic>?);
      // }
    } catch (e) {
      change(null, status: RxStatus.error('$e FROM GET ASSIGNMENT'));
    }
  }

  downloadDocument(String urlDocument) async {
    var status = await Permission.storage.request();

    if (status.isGranted) {
      final baseStorage = await getExternalStorageDirectory();

      await FlutterDownloader.enqueue(
        url: urlDocument,
        headers: {}, // optional: header send with url (auth token etc)
        savedDir: baseStorage!.path,
        showNotification:
            true, // show download progress in status bar (for Android)
        openFileFromNotification:
            true, // click on notification to open downloaded file (for Android)
        saveInPublicStorage: true,
      );
    }
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, status, progress]);
  }

  void late(String deadline) {
    final dateFormat = DateFormat('dd/MM/yyyy').add_Hms();
    final date = dateFormat.parse(deadline);
    final now = DateTime.now();
    final result = now.isAfter(date);
    isLate.value = result;
  }

  submitStudentWork() async {
    try {
      isLoading.value = true;
      final paramIdSession = Get.arguments;

      if (file != null) {
        final result =
            await _assignmentProvider.submitStudentWork(paramIdSession, file!);
        // await getAssignmentById(paramIdSession);
        change(result, status: RxStatus.success());
        isLoading.value = false;
        Get.defaultDialog(title: 'Success', middleText: 'asdf');
      } else {
        Get.defaultDialog(
            title: 'Gagal',
            middleText: 'Tidak bisa mengirim tugas, file kosong');
      }
    } catch (e) {
      isLoading.value = false;
      Get.defaultDialog(title: 'Error', middleText: e.toString());
    }
  }

  cancelStudentWork() async {
    try {
      isLoading.value = true;
      final paramIdSession = Get.arguments;
      var result = await _assignmentProvider.cancelStudentWork(paramIdSession);
      await getAssignmentById(paramIdSession);
      isLoading.value = false;
      Get.defaultDialog(title: 'Success', middleText: result['message']);
    } catch (e) {
      isLoading.value = false;
      Get.defaultDialog(title: 'Error', middleText: e.toString());
    }
  }

  // openFileFromAPI() async {
  //   final Uri url = Uri.parse('${state?.assignment}');
  //   await launchUrl(url, mode: LaunchMode.externalApplication);
  // }

  openFile() async {
    await OpenFilex.open(file?.path);
  }

  // List<PlatformFile>? files = [];
  // RxList<XFile>? tes;

  Future pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'doc', 'docx', 'png'],
        type: FileType.custom,
        // allowMultiple: true,
      );

      if (result != null) {
        isEmpty.value = false;
        file = XFile(result.files.single.path!);
        fileName.value = file?.name ?? '';
        final fileSize = await file?.length();
        if (fileSize! > 2000000) {
          removeFile();
          return Get.defaultDialog(
            title: 'File Terlalu Besar',
            middleText: 'Ukuran File yang diterima tidak lebih dari 2MB',
          );
        }
      } else {
        file = null;
      }
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }

  Future removeFile() async {
    try {
      bool? result = await FilePicker.platform.clearTemporaryFiles();
      if (result == true) {
        isEmpty.value = true;
        fileName.value = '';
      }
    } catch (e) {
      Get.snackbar('error', e.toString());
      // print(e);
    }
  }

  // upload from camera

  Future openCamera() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
    );
    if (pickedImage != null) {
      isEmpty.value = false;
      file = XFile(pickedImage.path);
      fileName.value = basename(file!.path);
      final fileSize = await file?.length();
      if (fileSize! > 2000000) {
        removeFile();
        return Get.defaultDialog(
          title: 'File Terlalu Besar',
          middleText: 'Ukuran File yang diterima tidak lebih dari 2MB',
        );
      }
    }
  }

  // Future removeCamera() async {
  //   file = null;
  //   fileName.value = '';
  // }

  @override
  void onInit() {
    IsolateNameServer.registerPortWithName(
        port.sendPort, 'downloader_send_port');
    getAssignmentById(Get.arguments);
    FlutterDownloader.registerCallback(downloadCallback);
    super.onInit();
  }
}
