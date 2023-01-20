import 'package:kampus_gratis/models/DSA/DSA_model.dart';
import 'package:kampus_gratis/services/repository/DSA/DSA_repository.dart';

class DSAProvider {
  final DSARepository _dsaRepository;

  DSAProvider(this._dsaRepository);

  Future<List<DsaModel>?> getData() async {
    var response = await _dsaRepository.getAllData();

    // List<dynamic> data = response["data"];

    // List<DsaModel> result = [];

    // for (var element in data) {
    //   result.add(DsaModel.fromJson(element));
    // }

    // return result;

    return Dsa.fromJson(response).data;
  }

  Future submitschedule(String timeParam, String idParam) async {
    var result = await _dsaRepository.submitSchedule(timeParam, idParam);

    print(result);

    return result;
  }
}
