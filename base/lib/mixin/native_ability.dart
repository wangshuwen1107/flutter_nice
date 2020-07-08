import 'dart:async';

import 'package:flutter/services.dart';
import 'package:router_plugin/router_plugin.dart';

mixin NativeRouter {
  nativeRoute(String url) {
    RouterPlugin.page(url).then((val) {
      print("NativeRouter Route url = $url result=$val");
    });
  }
}

mixin NativeEvent {

  static const stream = const EventChannel('cn.cheney.nice');

  StreamSubscription _timerSubscription;

  void _enableTimer<T>(void onData(T event)) {
    if (_timerSubscription == null) {
      _timerSubscription =
          stream.receiveBroadcastStream().listen(onData); // 添加监听
    }
  }

  void _disableTimer() {
    if (_timerSubscription != null) {
      _timerSubscription.cancel();
      _timerSubscription = null;
    }
  }

}
