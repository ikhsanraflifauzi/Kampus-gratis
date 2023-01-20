import 'package:kampus_gratis/services/networks/api_service.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class DiscussionGlobalRepository {
  final ApiService _apiService;

  DiscussionGlobalRepository(this._apiService);

  Future<JSON> getAllDiscussionGlobal() async {
    var response = await _apiService.get(
      endpoint: '/forum/discussionforum/global',
      requiresAuthToken: true,
    );

    return response;
  }

  Future postMakeDf(String title, String content) async {
    var request = await _apiService.post(
      endpoint: '/forum/discussionforum/create',
      requiresAuthToken: true,
      body: {
        "title": title,
        "content": content,
        "session_id": null,
      },
    );

    return request;
  }
}
