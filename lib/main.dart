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
      routes: {"/home": (context) => HomePage()},
      home: _widgetForRoute(window.defaultRouteName),
    );
  }

  Widget _widgetForRoute(String route) {
    Uri uri = Uri.parse(route);
    String pageName = uri.path;
    print("pageName = $pageName pageParams:${uri.queryParameters}");
    switch (pageName) {
      case '/index':
        return IndexPage();
    }
    return IndexPage();
  }
}
