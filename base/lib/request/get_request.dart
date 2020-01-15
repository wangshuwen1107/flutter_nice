import 'package:base/request/base_request.dart';
import 'package:base/request/http_request.dart';
import 'package:dio/dio.dart';

class GetRequest extends BaseRequest {

  GetRequest.form(String path, {
    Map<String, dynamic> paramsMap,
    Map<String, dynamic> headerMap})
      : super.form(path, paramsMap: paramsMap, headerMap: headerMap);


  @override
  Future<Response> enqueue() async {
    return await HttpRequest.instance().dio.get(path, queryParameters: paramsMap,options: getOption());
  }

  Options getOption() {
    Options options = Options();
    options.headers = headerMap;
    return options;
  }

}
