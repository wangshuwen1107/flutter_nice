import 'package:dio/dio.dart';

abstract class BaseRequest {
  String path;

  Map<String, dynamic> defaultHeadMap = {
    "app": 'android1.4.2',
    'version': '1.4.0'
  };

  Map<String, dynamic> paramsMap;

  Map<String, dynamic> headerMap = {};

  Future<Response> enqueue();

  BaseRequest.form(this.path,
      {this.paramsMap, Map<String, dynamic> headerMap}) {
    this.headerMap.addAll(defaultHeadMap);
    this.headerMap['path'] = path;
    if (null != headerMap) {
      this.headerMap.addAll(headerMap);
    }
  }
}
