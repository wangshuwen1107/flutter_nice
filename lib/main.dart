import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_nice/pages/index_page.dart';
import 'package:home/pages/home_page.dart';

void main() {
  runApp(new DCFlutterApp());
}

class DCFlutterApp extends StatelessWidget with WidgetsBindingObserver {

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addObserver(this);
    return MaterialApp(
      routes: {
    "/home":(context)=>HomePage()

    },
      home: _widgetForRoute(window.defaultRouteName),
    );
  }

  Widget _widgetForRoute(String route) {
    print("route:" + route.toString());
    //解析路由参数
    String pageName = _getPageName(route);
    Map<String, dynamic> pageParams = json.decode(_parseNativeParams(route));
    //路由参数
    print("route pageName:" + pageName.toString());
    //业务参数
    print("route pageParams:" + pageParams.toString());
    switch (pageName) {
      case '/index':
        return IndexPage();
    }
    return IndexPage();
  }

  String _getPageName(String route) {
    String pageName = route;
    if (route.indexOf("?") != -1)
      pageName = route.substring(0, route.indexOf("?"));
    return pageName;
  }

  String _parseNativeParams(String route) {
    Map<String, dynamic> nativeParams = {};
    if (route.indexOf("?") != -1) {
      nativeParams = json.decode(route.substring(route.indexOf("?") + 1));
    }
    return nativeParams['pageParams'] ?? "{}";
  }
}
