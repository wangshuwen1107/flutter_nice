import 'package:base/request/base_request.dart';
import 'package:base/request/http_request.dart';
import 'package:dio/dio.dart';

class PostRequest extends BaseRequest {
  //todo 默认配置
  Map<String, dynamic> bodyMap = {"app": 'android1.4.2', 'version': '1.4.0'};

  String contentType=Headers.jsonContentType;

  PostRequest.form(String path,
      {Map<String, dynamic> paramsMap,
      Map<String, dynamic> headerMap,
      this.contentType,
      Map<String, dynamic> bodyMap})
      : super.form(path, paramsMap: paramsMap, headerMap: headerMap) {
    if (null != bodyMap) {
      this.bodyMap.addAll(bodyMap);
    }
  }

  @override
  Future<Response> enqueue() {
    return HttpRequest.instance().dio.post(path,
        queryParameters: paramsMap,
        options: getOption(),
        data: bodyMap);
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
