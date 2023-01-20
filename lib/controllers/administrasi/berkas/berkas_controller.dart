import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kampus_gratis/models/administrasi/administrasi_model.dart';
import 'package:kampus_gratis/models/administrasi/file_statement_model.dart';
import 'package:kampus_gratis/services/providers/administrasi/administrasi_provider.dart';
import 'package:kampus_gratis/widgets/snackbar.dart';

import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../themes/themes.dart';

class BerkasController extends GetxController
    with StateMixin<AdministrasiModels?> {
  final AdministrasiProvider _administrasiProvider;
  BerkasController(this._administrasiProvider);
  RxBool isEmpty = true.obs;
  RxString fileName = ''.obs;
  RxString administrasiId = ''.obs;
  RxBool isLoading = false.obs;
  XFile? file;
  XFile? ktp;
  XFile? kk;
  XFile? certificate;
  XFile? pasFoto;
  XFile? khs;
  XFile? lastCertificateDiploma;
  XFile? parentStatement;
  RxString ktpFileName = ''.obs;
  RxString kkFileName = ''.obs;
  RxString certificateFileName = ''.obs;
  RxString fotoFileName = ''.obs;
  RxString khsFileName = ''.obs;
  RxString lastCertificateDiplomaFileName = ''.obs;
  RxString parentStatementFileName = ''.obs;

  String? parentStatementLink;

  ReceivePort port = ReceivePort();

  Future pickFile(int kategori) async {
    try {
      final result = await FilePicker.platform.pickFiles(
          allowedExtensions: ['pdf', 'jpg', 'png'], type: FileType.custom);
      if (result != null) {
        isEmpty.value = false;
        file = XFile(result.files.single.path!);
        final fileSize = await file?.length();
        if (fileSize! > 2000000) {
          removeFile();
          return Get.defaultDialog(
              title: "Ukuran File Terlalu Besar",
              middleText: "Ukuran File yang diterima tidak lebih dari 2MB");
        }
      }
      switch (kategori) {
        case 0:
          ktp = file;
          ktpFileName.value = '';
          break;
        case 1:
          kk = file;
          kkFileName.value = '';
          break;
        case 2:
          pasFoto = file;
          fotoFileName.value = '';
          break;
        case 3:
          lastCertificateDiploma = file;
          lastCertificateDiplomaFileName.value = '';
          break;
        default:
          file = null;
      }
      update();
    } catch (e) {
      Get.defaultDialog(middleText: e.toString());
    }
  }

  pickFilePdf(int kategori) async {
    try {
      final result = await FilePicker.platform
          .pickFiles(allowedExtensions: ['pdf'], type: FileType.custom);
      if (result != null) {
        isEmpty.value = false;
        file = XFile(result.files.single.path!);
        final fileSize = await file?.length();
        if (fileSize! > 2000000) {
          removeFile();
          return Get.defaultDialog(
              title: "Ukuran File Terlalu Besar",
              middleText: "Ukuran File yang diterima tidak lebih dari 2MB");
        }
        switch (kategori) {
          case 0:
            certificate = file;
            certificateFileName.value = '';
            break;
          case 1:
            khs = file;
            khsFileName.value = '';
            break;
          case 2:
            parentStatement = file;
            parentStatementFileName.value = '';
            break;
          default:
            file = null;
        }
      }
      update();
    } catch (e) {
      Get.defaultDialog(middleText: e.toString());
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
      // print(e);
    }
  }

  Future deleteFile(int kategori) async {
    switch (kategori) {
      case 0:
        {
          ktp = null;
          break;
        }
      case 1:
        {
          kk = null;
          break;
        }
      case 2:
        {
          certificate = null;
          break;
        }
      case 3:
        {
          pasFoto = null;
          break;
        }
      case 4:
        {
          khs = null;
          break;
        }
      case 5:
        {
          lastCertificateDiploma = null;
          break;
        }
      case 6:
        {
          parentStatement = null;
          break;
        }
    }
    update();
  }

  Future openFile(String? file) async {
    try {
      await OpenFilex.open(file);
    } catch (e) {
      return;
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

  getAdministrasi() async {
    try {
      AdministrasiModels? data = await _administrasiProvider.getAdministrasi();
      change(data, status: RxStatus.success());
      administrasiId.value = data?.administrationId ?? '';
      data?.files?.ninCard != null
          ? ktpFileName.value = basename(data!.files!.ninCard)
          : ktpFileName.value = '';
      data?.files?.certificate != null
          ? certificateFileName.value = basename(data!.files!.certificate)
          : certificateFileName.value = '';
      data?.files?.familyCard != null
          ? kkFileName.value = basename(data!.files!.familyCard)
          : kkFileName.value = '';
      data?.files?.photo != null
          ? fotoFileName.value = basename(data!.files!.photo)
          : fotoFileName.value = '';
      data?.files?.transcript != null
          ? khsFileName.value = basename(data!.files!.transcript)
          : khsFileName.value = '';
      data?.files?.lastCertificateDiploma != null
          ? lastCertificateDiplomaFileName.value =
              basename(data!.files!.lastCertificateDiploma)
          : lastCertificateDiplomaFileName.value = '';
      data?.files?.parentStatement != null
          ? parentStatementFileName.value =
              basename(data!.files!.parentStatement)
          : parentStatementFileName.value = '';
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> putFiles() async {
    List<Map<String, File?>> bodyFiles = [];
    if (ktp != null) {
      File ktpFile = File(ktp!.path);
      bodyFiles.add({'ktp': ktpFile});
    }
    if (kk != null) {
      File kkFile = File(kk!.path);
      bodyFiles.add({'kk': kkFile});
    }
    if (certificate != null) {
      File certificateFile = File(certificate!.path);
      bodyFiles.add({'certificate': certificateFile});
    }
    if (pasFoto != null) {
      File pasFotoFile = File(pasFoto!.path);
      bodyFiles.add({'pasFoto': pasFotoFile});
    }
    if (khs != null) {
      File khsFile = File(khs!.path);
      bodyFiles.add({'khs': khsFile});
    }

    if (lastCertificateDiploma != null) {
      File lfd = File(lastCertificateDiploma!.path);
      bodyFiles.add({'lastCertificateDiploma': lfd});
    }
    if (parentStatement != null) {
      File ps = File(parentStatement!.path);
      bodyFiles.add({'parentStatement': ps});
    }

    try {
      isLoading.value = true;
      await _administrasiProvider.putFiles(administrasiId.value, bodyFiles);
      Get.showSnackbar(
        GetSnackBar(
          messageText: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Data Berhasil Disimpan",
                style: Themes.darkTheme.textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 13),
              const Icon(
                Icons.check_circle,
                color: Colors.white,
              )
            ],
          ),
          margin: const EdgeInsets.fromLTRB(40, 0, 40, 60),
          backgroundColor: const Color(0xFF3AAA35),
          duration: const Duration(seconds: 1),
          borderRadius: 8,
        ),
      );

      Get.toNamed('/jenjang-pendidikan');

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.defaultDialog(title: 'Error', middleText: e.toString());
    }
  }

  getParentStatementLink() async {
    try {
      FileStatement? statementLink =
          await _administrasiProvider.getParentStatementLink();
      parentStatementLink = statementLink?.statementParentLink;
    } catch (e) {
      KGSnackBar.showKGSnackBar(Get.context!, e.toString(),
          backgroundColor: Colors.red);
    }
  }

  // sementara
  Future<void> setFreshToken() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GetStorage storage = GetStorage();
    final user = auth.currentUser;

    if (user != null) {
      final token = await user.getIdToken();
      await storage.write('token', token);
    }
  }

  @override
  void onInit() async {
    getAdministrasi();
    getParentStatementLink();
    IsolateNameServer.registerPortWithName(
        port.sendPort, 'downloader_send_port');
    FlutterDownloader.registerCallback(downloadCallback);
    super.onInit();
  }
}
