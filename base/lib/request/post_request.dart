import 'dart:ffi';

import 'package:base/request/base_request.dart';
import 'package:base/request/http_request.dart';
import 'package:dio/dio.dart';

class PostRequest extends BaseRequest {

  Map<String, dynamic> bodyMap;
  String contentType;

  PostRequest.form(String path, Map<String, dynamic> paramsMap, {this.bodyMap})
      : super.form(path, paramsMap);

  @override
  Future enqueue() async {
    return await HttpRequest.instance().dio.post(path,
        queryParameters: paramsMap,
        options: contentType != null ? Options(contentType: contentType) : null,
        data: FormData.fromMap(bodyMap));
  }


}
