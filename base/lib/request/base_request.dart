import 'package:dio/dio.dart';

abstract class BaseRequest {
  String path;

  Map<String, dynamic> paramsMap;

  Map<String, dynamic> headerMap = {};

  Future<Response> enqueue();

  BaseRequest.form(this.path,
      {this.paramsMap, Map<String, dynamic> headerMap}) {
    this.headerMap['path'] = path;
    if (null != headerMap) {
      this.headerMap.addAll(headerMap);
    }
  }
}
