import 'package:kampus_gratis/services/networks/api_service.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class JobRepository {
  final ApiService _apiService;
  JobRepository(this._apiService);

  Future<JSON> allJobs(JSON param) async {
    var response = await _apiService.get(
      endpoint: '/jobs/all',
      // requiresAuthToken: true,
      query: param,
    );
    return response;
  }

  Future<JSON> jobDetail(String id) async {
    var response = await _apiService.get(endpoint: '/jobs/job/$id');
    return response;
  }
}
