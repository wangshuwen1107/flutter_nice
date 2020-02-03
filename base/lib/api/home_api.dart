import 'package:base/entity/home/home_data.dart';
import 'package:base/request/http_request.dart';

class HomeApi {
  static HomeApi _instance;

  static _getInstance() {
    if (_instance == null) {
      _instance = HomeApi._internal();
    }
    return _instance;
  }

  factory HomeApi.instance() => _getInstance();

  HomeApi._internal();

  ///首页获取
  Future<HomeData> getHomeData() {
    return HttpRequest.instance().post("/functions/home").then((response) {
      return HomeData.fromJson(response.data);
    });
  }

  ///首页加载更多
  Future<HomePostData> recommendPosts(int nextKey) {
    return HttpRequest.instance().post(
        "/functions/recommendPosts", {'nextKey': nextKey}).then((response) {
      return HomePostData.fromJson(response.data);
    });
  }
}
