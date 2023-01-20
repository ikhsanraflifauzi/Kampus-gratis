import 'dart:io';

import 'package:get/get.dart';
import 'package:kampus_gratis/models/administrasi/administrasi_model.dart';
import 'package:kampus_gratis/models/administrasi/file_statement_model.dart';
import 'package:kampus_gratis/services/repository/administrasi/administrasi_repository.dart';
import 'package:kampus_gratis/utils/typedef.dart';
import 'package:path/path.dart';

class AdministrasiProvider {
  final AdministrasiRepository _administrasiRepository;

  AdministrasiProvider(this._administrasiRepository);

  Future<AdministrasiModels?> getAdministrasi() async {
    var response = await _administrasiRepository.getAdministrasi();
    return Administrasi.fromJson(response).data;
  }

  Future<AdministrasiModels?> putBiodata(JSON body) async {
    var response = await _administrasiRepository.putBiodata(body);
    return Administrasi.fromJson(response).data;
  }

  Future<AdministrasiModels?> putFamilial(JSON body) async {
    var response = await _administrasiRepository.putFamilial(body);
    return Administrasi.fromJson(response).data;
  }

  Future<AdministrasiModels?> putDegree(JSON body) async {
    var response = await _administrasiRepository.putDegree(body);
    return Administrasi.fromJson(response).data;
  }

  Future<JSON?> putFiles(
      String administrasiId, List<Map<String, File?>> files) async {
    // try {

    var formData = FormData({
      'administration_id': administrasiId,
    });

    for (var value in files) {
      File? ktp = value['ktp'];
      File? lfd = value['lastCertificateDiploma'];
      File? kk = value['kk'];
      File? ijazah = value['ijazah'];
      File? pasFoto = value['pasFoto'];
      File? khs = value['khs'];
      File? ps = value['suratRekomendasi'];
      String? ktpContentType;
      String? lfdContentType;
      String? kkContentType;
      String? fotoContentType;
      String ktpExt = extension(ktp?.path != null ? ktp!.path : '');
      String lfdExt = extension(lfd?.path != null ? lfd!.path : '');
      String kkExt = extension(kk?.path != null ? kk!.path : '');
      String fotoExt = extension(pasFoto?.path != null ? pasFoto!.path : '');
      switch (ktpExt) {
        case '.pdf':
          ktpContentType = 'application/pdf';
          break;
        case '.png':
          ktpContentType = 'image/png';
          break;
        case '.jpg':
          ktpContentType = 'image/jpg';
          break;
        case '.jpeg':
          ktpContentType = 'image/jpeg';
          break;
        default:
          ktpContentType = '';
      }
      switch (lfdExt) {
        case '.pdf':
          lfdContentType = 'application/pdf';
          break;
        case '.png':
          lfdContentType = 'image/png';
          break;
        case '.jpg':
          lfdContentType = 'image/jpg';
          break;
        case '.jpeg':
          lfdContentType = 'image/jpeg';
          break;
        default:
          lfdContentType = '';
      }
      switch (kkExt) {
        case '.pdf':
          kkContentType = 'application/pdf';
          break;
        case '.png':
          kkContentType = 'image/png';
          break;
        case '.jpg':
          kkContentType = 'image/jpg';
          break;
        case '.jpeg':
          kkContentType = 'image/jpeg';
          break;
        default:
          kkContentType = '';
      }
      switch (fotoExt) {
        case '.pdf':
          fotoContentType = 'application/pdf';
          break;
        case '.png':
          fotoContentType = 'image/png';
          break;
        case '.jpg':
          fotoContentType = 'image/jpg';
          break;
        case '.jpeg':
          fotoContentType = 'image/jpeg';
          break;
        default:
          fotoContentType = '';
      }

      if (lfd != null) {
        formData.files.add(MapEntry(
            'last_certificate_diploma',
            MultipartFile(lfd.path,
                contentType: lfdContentType, filename: basename(lfd.path))));
      }
      if (ktp != null) {
        formData.files.add(MapEntry(
            'nin_card',
            MultipartFile(ktp.path,
                contentType: ktpContentType, filename: basename(ktp.path))));
      }
      if (kk != null) {
        formData.files.add(MapEntry(
            'family_card',
            MultipartFile(kk.path,
                contentType: kkContentType, filename: basename(kk.path))));
      }
      if (ijazah != null) {
        formData.files.add(MapEntry(
            'certificate',
            MultipartFile(ijazah.path,
                contentType: 'application/pdf',
                filename: basename(ijazah.path))));
      }
      if (pasFoto != null) {
        formData.files.add(MapEntry(
            'photo',
            MultipartFile(pasFoto.path,
                contentType: fotoContentType,
                filename: basename(pasFoto.path))));
      }
      if (khs != null) {
        formData.files.add(MapEntry(
            'transcript',
            MultipartFile(khs.path,
                contentType: 'application/pdf', filename: basename(khs.path))));
      }
      if (ps != null) {
        formData.files.add(MapEntry(
            'parent_statement',
            MultipartFile(ps.path,
                contentType: 'application/pdf', filename: basename(ps.path))));
      }
    }

    return await _administrasiRepository.putFiles(formData);
  }

  Future<FileStatement?> getParentStatementLink() async {
    var response = await _administrasiRepository.getParentStatementLink();
    return Statement.fromJson(response).data;
  }
}
