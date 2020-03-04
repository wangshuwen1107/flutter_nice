import 'package:base/request/http_request.dart';

class CommonApi {
  static CommonApi _instance;

  factory CommonApi.instance() => _getInstance();

  static _getInstance() {
    if (_instance == null) {
      _instance = CommonApi._internal();
    }
    return _instance;
  }

  CommonApi._internal();

  ///获取云端动态链接
  Future<Map<String, dynamic>> getCloudUrl(String type) {
    return HttpRequest.instance().post("/functions/" + type).then((response) {
      return response.data;
    });
  }
}
