import 'package:base/entity/request_data.dart';
import 'package:base/request/get_request.dart';
import 'package:base/request/post_request.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class HttpRequest {

  static const String BASE_URL = "https://api.dingstock.net";

  static HttpRequest _instance;
  Dio dio;

  static const inProduction = const bool.fromEnvironment("dart.vm.product");

  factory HttpRequest.instance() => _getInstance();

  HttpRequest._internal() {
    dio = Dio(BaseOptions(connectTimeout: 15000, baseUrl: BASE_URL, headers: {
      'x-parse-application-id': 'K2Dw31SA6bpDIDWEQQe409F8Bkp1PuPYnFqDiHDL',
      'x-parse-installation-id': 'a08cf4f3-2ba4-44cb-8752-a7fdb464864b',
    }));
    if (!inProduction) {
      dio.interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
        print("\n================== 请求数据 ==========================");
        print("url = ${options.uri.toString()}");
        print("headers = ${options.headers}");
        print("params = ${options.data}");
        print("method = ${options.method}");
      }, onResponse: (Response response) {
        print("\n================== 响应数据 ==========================");
        print("code = ${response.statusCode}");
        //print("data = ${response.data}");
        print("\n");
      }, onError: (DioError e) {
        print("\n================== 错误响应数据 ======================");
        print("type = ${e.type}");
        print("message = ${e.message}");
        print("\n");
      }));
    }
  }

  static _getInstance() {
    if (_instance == null) {
      _instance = HttpRequest._internal();
    }
    return _instance;
  }

  void get (String path, [Map<String, dynamic> paramsMap]) {
    var future = GetRequest.form(path).enqueue();
    request(future);
  }

  Future post (String path,
      [Map<String, dynamic> paramsMap,
      Map<String, dynamic> bodyMap,
      String contentType]) {
    var future = PostRequest.form(path,
            paramsMap: paramsMap, bodyMap: bodyMap, contentType: contentType)
        .enqueue();
    return request(future);
  }

  Future request (Future<Response> future) {
    return future.then((Response response) {
      if (response.statusCode < 200 || null == response.data) {
        throw RequestData(
            success: false,
            errorMsg: '${response.statusMessage}',
            errorCode: '${response.statusCode}');
      } else {
        var rootResult = response.data['result'];
        if (null == rootResult) {
          throw RequestData(
              success: false,
              errorCode: 'RESULT_EMPTY',
              errorMsg: 'RESULT_EMPTY');
        } else {
          var finallyResult = rootResult['result'];
          return RequestData(success: true, data: finallyResult);
        }
      }
    }).catchError((error) {
      throw error;
    });
  }
}
