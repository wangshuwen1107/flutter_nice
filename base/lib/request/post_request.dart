import 'package:base/request/base_request.dart';
import 'package:base/request/http_request.dart';
import 'package:dio/dio.dart';

class PostRequest extends BaseRequest {
  Map<String, dynamic> bodyMap;
  String contentType;

  PostRequest.form(String path,
      {Map<String, dynamic> paramsMap,
      Map<String, dynamic> headerMap,
      this.contentType,
      this.bodyMap})
      : super.form(path, paramsMap: paramsMap, headerMap: headerMap);

  Future<Response> enqueue() async {
    return await HttpRequest.instance().dio.post(path,
        queryParameters: paramsMap,
        options: getOption(),
        data: FormData.fromMap(bodyMap));
  }

  Options getOption() {
    Options options = Options();
    if (null != contentType) {
      options.contentType = contentType;
    }
    options.headers = headerMap;
    return options;
  }
}
