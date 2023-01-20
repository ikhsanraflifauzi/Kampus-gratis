import 'package:kampus_gratis/services/networks/api_service.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class DSARepository {
  final ApiService _apiService;

  DSARepository(this._apiService);

  Future<JSON> getAllData() async {
    var response = await _apiService.get(
      endpoint: '/assessment',
      requiresAuthToken: true,
    );
    return response;
  }

  Future<JSON> submitSchedule(String timeParam, String idParam) async {
    var response = await _apiService.post(
      endpoint: '/assessment/assessor/$idParam',
      requiresAuthToken: true,
      body: {"time": "2022-12-14T09:06:30.369Z"},
    );

    return response;
  }
}
