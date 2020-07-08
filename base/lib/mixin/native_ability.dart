import 'dart:async';

import 'package:base/util/util.dart';
import 'package:flutter/services.dart';
import 'package:router_plugin/router_plugin.dart';

mixin NativeRouter {
  nativeRoute(String url, [Map<String, dynamic> params]) {
    RouterPlugin.page(url, params).then((val) {
      print("NativeRouter Route url = $url result=$val");
    });
  }
}

mixin NativeEvent {
  static const stream = const EventChannel('cn.cheney.nice');

  StreamSubscription _timerSubscription;

  void enableTimer<T>(String event, void onData(T event)) {
    if (_timerSubscription == null) {
      _timerSubscription = stream.receiveBroadcastStream().listen((val) {
        if (null == val) {
          return;
        }
        if (val is! Map<String, Object>) {
          return;
        }
        String eventName = val['event'];
        if (isEmpty(eventName) || eventName != event) {
          return;
        }
        onData(val);
      });
    }
  }

  void disableTimer() {
    if (_timerSubscription != null) {
      _timerSubscription.cancel();
      _timerSubscription = null;
    }
  }
}
