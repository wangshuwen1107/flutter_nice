import 'package:base/entity/request_data.dart';
import 'package:base/request/get_request.dart';
import 'package:dio/dio.dart';

class HttpRequest {
  static const String BASE_URL = "https://api.dingstock.net";
  static HttpRequest _instance;
  Dio dio;

  static const inProduction = const bool.fromEnvironment("dart.vm.product");

  factory HttpRequest.instance() => _getInstance();

  HttpRequest._internal() {
    dio = Dio(BaseOptions(connectTimeout: 15000, baseUrl: BASE_URL));
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

  /// 获取单例内部方法
  static _getInstance() {
    if (_instance == null) {
      _instance = HttpRequest._internal();
    }
    return _instance;
  }

  get(String path, [Map<String, dynamic> paramsMap]) async {
    await GetRequest.form(path, paramsMap)
        .enqueue()
        .then((Response response) {
          if(response.statusCode<200){
          }
         })
        .catchError((Error response) => {});
  }


//  static request(String path, [Map<String, dynamic> query]) async {
//    Response response;
//    try {
//      response = await di.request(path, queryParameters: query);
//    } on DioError catch (e) {
//      return RequestData(
//          errorCode: e.type.toString(), errorMsg: e.message, success: false);
//    }
//    if (null == response || null == response.data) {
//      return RequestData(errorCode: "empty", errorMsg: "empty", success: false);
//    }
//    //业务上的错误
//    var bizRep = response.data;
//    if (!bizRep['success']) {
//      return RequestData(
//          success: false,
//          errorMsg: bizRep['errorMsg'],
//          errorCode: bizRep['errorCode']);
//    }
//    return RequestData(success: true, data: bizRep['data']);
//  }
}
