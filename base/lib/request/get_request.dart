import 'dart:ffi';

import 'package:base/request/base_request.dart';
import 'package:base/request/http_request.dart';
import 'package:dio/dio.dart';

class GetRequest extends BaseRequest {

  GetRequest.form(String path, Map<String, dynamic> paramsMap)
      : super.form(path, paramsMap);

  @override
  Future<Response> enqueue() async {
    return await HttpRequest
        .instance()
        .dio
        .get(path, queryParameters: paramsMap);
  }

}
