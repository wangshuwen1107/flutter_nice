import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:home/pages/home_page.dart';
import 'pages/index_page.dart';

void main() => runApp(MyApp(route: window.defaultRouteName));

class MyApp extends StatelessWidget {
  final String route;

  const MyApp({Key key, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          'page/home/index': (context) => HomePage(),
        },
        home: getPageBy(route));
  }

  getPageBy(String route) {
    print('route = $route');
    if (route == null) {
      return Container();
    }
    switch (route) {
      case 'page/home/index':
        return HomePage();
      case '/':
        return IndexPage();
    }
  }
}
