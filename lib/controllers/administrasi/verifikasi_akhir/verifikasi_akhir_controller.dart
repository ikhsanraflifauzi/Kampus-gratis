import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kampus_gratis/models/administrasi/administrasi_model.dart';
import 'package:kampus_gratis/widgets/snackbar.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../models/administrasi/file_statement_model.dart';
import '../../../services/providers/administrasi/administrasi_provider.dart';
import '../../../themes/themes.dart';
import '../../../utils/typedef.dart';

class VerifikasiAkhirController extends GetxController
    with StateMixin<AdministrasiModels?> {
  VerifikasiAkhirController(this._administrasiProvider);
  final AdministrasiProvider _administrasiProvider;
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController ninController;
  late TextEditingController semesterController;
  late TextEditingController residenceAddressController;
  late TextEditingController ninAddressController;
  late TextEditingController birthPlaceController;
  late TextEditingController phoneController;
  late TextEditingController nsnController;
  late TextEditingController universityOfOriginController;
  late TextEditingController fatherNameController;
  late TextEditingController fatherOccupationController;
  late TextEditingController motherNameController;
  late TextEditingController motherOccupationController;
  late TextEditingController occupationController;
  String? administrasiId;
  String? jenjangPendidikan;
  String? fatherIncome;
  String? motherIncome;
  String? income;
  String? livingPartner;
  String? financier;
  String? selectedGender;
  String? parentStatementLink;
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
  RxString gender = ''.obs;
  RxString fileName = ''.obs;
  Rx<TextEditingController> birthDateController = TextEditingController().obs;
  RxBool isEmpty = true.obs;
  RxBool isLoading = false.obs;
  List<String> items = ['Laki - Laki', 'Perempuan'];
  List<String> fatherIncomeItems = [
    'Rp. 0 - 1.000.000',
    'Rp. 1.000.000 - 1.500.000',
    'Rp. 1.500.000 - 2.000.000',
    'Rp. 2.000.000 - 3.000.000',
    'Rp. 3.000.000 - 4.000.000',
    'Rp. 4.000.000 - 5.000.000',
    'Rp. 5.000.000 - 6.000.000',
    'Rp. 6.000.000 - 7.000.000',
    'Rp. > 7.000.000'
  ];
  List<String> motherIncomeItems = [
    'Rp. 0 - 1.000.000',
    'Rp. 1.000.000 - 1.500.000',
    'Rp. 1.500.000 - 2.000.000',
    'Rp. 2.000.000 - 3.000.000',
    'Rp. 3.000.000 - 4.000.000',
    'Rp. 4.000.000 - 5.000.000',
    'Rp. 5.000.000 - 6.000.000',
    'Rp. 6.000.000 - 7.000.000',
    'Rp. > 7.000.000'
  ];
  List<String> incomeItems = [
    'Rp. 0 - 1.000.000',
    'Rp. 1.000.000 - 1.500.000',
    'Rp. 1.500.000 - 2.000.000',
    'Rp. 2.000.000 - 3.000.000',
    'Rp. 3.000.000 - 4.000.000',
    'Rp. 4.000.000 - 5.000.000',
    'Rp. 5.000.000 - 6.000.000',
    'Rp. 6.000.000 - 7.000.000',
    'Rp. > 7.000.000'
  ];
  List<String> livingPartnerItems = [
    'Sendiri',
    'Orang Tua',
    'Wali',
  ];

  ReceivePort port = ReceivePort();

  Future getAdministrasi() async {
    try {
      AdministrasiModels? data = await _administrasiProvider.getAdministrasi();
      change(data, status: RxStatus.success());
      administrasiId = data?.administrationId;
      if (state?.biodata?.birthDate != null) {
        birthDateController.value =
            TextEditingController(text: state?.biodata!.birthDate.toString());
      }
      if (state?.biodata?.gender != null) {
        switch (state?.biodata?.gender) {
          case '1':
            selectedGender = 'Laki - Laki';
            gender.value = '1';
            break;
          case '2':
            selectedGender = 'Perempuan';
            gender.value = '2';
            break;
          default:
            null;
        }
      }
      if (state?.biodata?.fullName != null &&
          state?.biodata?.email != null &&
          state?.biodata?.nin != null &&
          state?.biodata?.semester != null &&
          state?.biodata?.residenceAddress != null &&
          state?.biodata?.ninAddress != null &&
          state?.biodata?.birthPlace != null &&
          state?.biodata?.phone != null) {
        fullNameController =
            TextEditingController(text: state?.biodata!.fullName);
        emailController = TextEditingController(text: state?.biodata!.email);
        ninController = TextEditingController(text: state?.biodata!.nin);
        semesterController =
            TextEditingController(text: state?.biodata!.semester);
        residenceAddressController =
            TextEditingController(text: state?.biodata!.residenceAddress);
        ninAddressController =
            TextEditingController(text: state?.biodata!.ninAddress);
        birthPlaceController =
            TextEditingController(text: state?.biodata!.birthPlace);
        phoneController = TextEditingController(text: state?.biodata!.phone);
      }
      if (state?.biodata?.universityOfOrigin != null &&
          state?.biodata?.nsn != null) {
        universityOfOriginController =
            TextEditingController(text: state?.biodata?.universityOfOrigin);
        nsnController = TextEditingController(text: state?.biodata?.nsn);
      }
      if (state?.familial?.fatherName != null &&
          state?.familial?.fatherOccupation != null &&
          state?.familial?.fatherIncome != null &&
          state?.familial?.motherName != null &&
          state?.familial?.motherOccupation != null &&
          state?.familial?.motherIncome != null &&
          state?.familial?.occupation != null &&
          state?.familial?.income != null &&
          state?.familial?.livingPartner != null &&
          state?.familial?.financier != null) {
        fatherNameController =
            TextEditingController(text: state?.familial!.fatherName);
        fatherOccupationController =
            TextEditingController(text: state?.familial!.fatherOccupation);
        fatherIncome = state?.familial!.fatherIncome;
        motherNameController =
            TextEditingController(text: state?.familial!.motherName);
        motherOccupationController =
            TextEditingController(text: state?.familial!.motherOccupation);
        motherIncome = state?.familial!.motherIncome;
        occupationController =
            TextEditingController(text: state?.familial!.occupation);
        income = state?.familial!.income;
        livingPartner = state?.familial!.livingPartner;
        financier = state?.familial!.financier;
      }
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
      if (state?.degree != null) {
        jenjangPendidikan = state?.degree;
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void setJP(String? newValue) {
    jenjangPendidikan = newValue;
  }

  void setGender(String? value) {
    switch (value) {
      case 'Laki - Laki':
        gender.value = '1';
        break;
      case 'Perempuan':
        gender.value = '2';
        break;
      default:
    }
    selectedGender = value!;
    update();
  }

  void setDropdown(String newValue, int kategori) {
    switch (kategori) {
      case 0:
        {
          fatherIncome = newValue;
          break;
        }
      case 1:
        {
          motherIncome = newValue;
          break;
        }
      case 2:
        {
          income = newValue;
          break;
        }
      case 3:
        {
          livingPartner = newValue;
          break;
        }
      case 4:
        {
          financier = newValue;
          break;
        }
      default:
        null;
    }
    update();
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

  void datePicker(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      birthDateController.value = TextEditingController(text: formattedDate);
    } else {}
  }

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

  Future putBiodata() async {
    JSON bodyBiodata = {
      "administration_id": administrasiId,
      "full_name": fullNameController.text,
      "email": emailController.text,
      "nin": ninController.text,
      "semester": semesterController.text,
      "nin_address": ninAddressController.text,
      "residence_address": residenceAddressController.text,
      "birth_place": birthPlaceController.text,
      "birth_date": birthDateController.value.text,
      "phone": phoneController.text,
      "gender": gender.value,
      "nsn": nsnController.text,
      "university_of_origin": universityOfOriginController.text
    };
    try {
      isLoading.value = true;
      await _administrasiProvider.putBiodata(bodyBiodata);
      isLoading.value = false;
    } catch (error) {
      isLoading.value = false;
      Get.back();
      Get.defaultDialog(
          middleText: error.toString(), onConfirm: () => Get.back());
    }
  }

  Future putFamilial() async {
    JSON bodyFamilial = {
      "father_name": fatherNameController.text,
      "father_occupation": fatherOccupationController.text,
      "father_income": fatherIncome,
      "mother_name": motherNameController.text,
      "mother_occupation": motherOccupationController.text,
      "mother_income": motherIncome,
      "occupation": occupationController.text,
      "income": income,
      "living_partner": livingPartner,
      "financier": financier
    };
    try {
      isLoading.value = true;
      await _administrasiProvider.putFamilial(bodyFamilial);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Data Tidak Lengkap !!!', 'Lengkapi Data Terlebih Dahulu');
      throw Exception(e.toString());
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
      bodyFiles.add({'suratRekomendasi': lfd});
    }
    if (parentStatement != null) {
      File ps = File(parentStatement!.path);
      bodyFiles.add({'suratRekomendasi': ps});
    }

    try {
      isLoading.value = true;
      await _administrasiProvider.putFiles(administrasiId!, bodyFiles);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.defaultDialog(title: 'Error', middleText: e.toString());
    }
  }

  Future putDegree() async {
    JSON body = {
      "administration_id": administrasiId,
      "degree": jenjangPendidikan,
    };
    try {
      isLoading.value = true;
      _administrasiProvider.putDegree(body);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Perhatian !!!', 'Jenjang Pendidikan Belum Dipilih');
    }
  }

  @override
  void onInit() {
    getAdministrasi();
    getParentStatementLink();
    IsolateNameServer.registerPortWithName(
        port.sendPort, 'downloader_send_port');
    FlutterDownloader.registerCallback(downloadCallback);
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    ninController = TextEditingController();

    semesterController = TextEditingController();
    ninAddressController = TextEditingController();
    residenceAddressController = TextEditingController();
    birthPlaceController = TextEditingController();
    birthDateController.value = TextEditingController();
    phoneController = TextEditingController();
    nsnController = TextEditingController();
    universityOfOriginController = TextEditingController();
    fatherNameController = TextEditingController();
    fatherOccupationController = TextEditingController();
    motherNameController = TextEditingController();
    motherOccupationController = TextEditingController();
    occupationController = TextEditingController();
    super.onInit();
  }

  Future verification() async {
    try {
      isLoading.value = true;
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
      await putBiodata();
      await putFamilial();
      await putFiles();
      await putDegree();
      Get.toNamed('/administrasi-success');
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      KGSnackBar.showKGSnackBar(Get.context!, e.toString(),
          backgroundColor: Colors.red);
    }
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    ninController.dispose();
    semesterController.dispose();
    ninAddressController.dispose();
    residenceAddressController.dispose();
    birthPlaceController.dispose();
    birthDateController.value.dispose();
    phoneController.dispose();
    nsnController.dispose();
    universityOfOriginController.dispose();
    fatherNameController.dispose();
    fatherOccupationController.dispose();
    motherNameController.dispose();
    motherOccupationController.dispose();
    occupationController.dispose();
    super.onClose();
  }
}
