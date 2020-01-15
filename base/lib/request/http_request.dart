import 'package:base/entity/request_data.dart';
import 'package:base/request/get_request.dart';
import 'package:base/request/post_request.dart';
import 'package:dio/dio.dart';

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
      }, onResponse: (Response response) {
        print("\n================== 响应数据 ==========================");
        print("code = ${response.statusCode}");
        print("data = ${response.data}");
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

  Future<RequestData> get(String path, [Map<String, dynamic> paramsMap]) async {
    await GetRequest.form(path).enqueue().then((Response response) {
      if (response.statusCode < 200 || null == response.data) {
        return RequestData(
            success: false,
            errorMsg: '${response.statusMessage}',
            errorCode: '${response.statusCode}');
      } else {
        return RequestData(success: true, data: response.data['data']);
      }
    }).catchError((DioError dioError) {
      return RequestData(
          success: false,
          errorMsg: '${dioError.type.toString()}',
          errorCode: '${dioError.message}');
    });
    return RequestData(success: false, errorCode: 'LOCAL_ERROR');
  }

  Future<RequestData> post(String path,
      [Map<String, dynamic> paramsMap,
      Map<String, dynamic> bodyMap,
      String contentType]) async {
    await PostRequest.form(path,
            paramsMap: paramsMap, bodyMap: bodyMap, contentType: contentType)
        .enqueue()
        .then((Response response) {
      if (response.statusCode < 200 || null == response.data) {
        return RequestData(
            success: false,
            errorMsg: '${response.statusMessage}',
            errorCode: '${response.statusCode}');
      } else {
        return RequestData(success: true, data: response.data['result']);
      }
    }).catchError((error) {
      print('ERROR =' + error.toString());
      return RequestData(
          success: false,
          errorMsg: error.toString(),
          errorCode: error.toString());
    });
  }
}
