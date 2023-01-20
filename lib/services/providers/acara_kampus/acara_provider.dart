import 'package:kampus_gratis/models/acara_kampus/acara_model.dart';
import 'package:kampus_gratis/services/repository/acara_kampus/acara_repository.dart';

class AcaraProvider {
  final AcaraRepository _acaraRepository;

  AcaraProvider(this._acaraRepository);
  Future<List<Result>?> getDataAcara() async {
    var response = await _acaraRepository.getAllEvent();

    final responseResult = AcaraModel.fromJson(response);

    final res = DataAcara.fromJson(responseResult.data);

    return res.result;
  }
}
