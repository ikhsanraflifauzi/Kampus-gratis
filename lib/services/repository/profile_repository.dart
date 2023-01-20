import 'package:get/get.dart';
import 'package:kampus_gratis/services/networks/api_service.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class ProfileRepository {
  final ApiService _apiService;
  final String profileUrl = '/profile';

  ProfileRepository(this._apiService);

  Future<JSON> getUser() async {
    var response = await _apiService.get(
        endpoint: '$profileUrl/me', requiresAuthToken: true);
    return response;
  }

  Future<JSON> updateUser(FormData body) async {
    print('body repo $body');
    var response = await _apiService.put(
      body: body,
      endpoint: '$profileUrl/me',
      requiresAuthToken: true,
    );
    return response;
  }
}
