import 'dart:io';
import 'dart:math';
import 'package:base/entity/request_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home_page.dart';
import 'monitoring_page.dart';
import 'circle_page.dart';
import 'mine_page.dart';
import 'compare_page.dart';
import 'package:base/request/http_request.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  static const bottomIconSize = 28.0;
  List pageList = [
    HomePage(),
    MonitoringPage(),
    CirclePage(),
    ComparePage(),
    MinePage()
  ];
  var currentIndex = 0;
  var currentPage;

  List<BottomNavigationBarItem> bottomTabList = [
    _buildBarItem(
        "首页", "images/tabbar_home_light.png", "images/tabbar_home_dark.png"),
    _buildBarItem("监控", "images/tabbar_monitoring_light.png",
        "images/tabbar_monitoring_dark.png"),
    _buildBarItem("比价", "images/tabbar_compare_light.png",
        "images/tabbar_compare_dark.png"),
    _buildBarItem("圈子", "images/tabbar_circle_light.png",
        "images/tabbar_circle_dark.png"),
    _buildBarItem(
        "我的", "images/tabbar_me_light.png", "images/tabbar_me_dark.png")
  ];

  static _buildBarItem(
      String title, String lightIconPath, String darkIconPath) {
    return BottomNavigationBarItem(
      icon: Image.asset(darkIconPath,
          width: bottomIconSize, height: bottomIconSize),
      activeIcon: Image.asset(lightIconPath,
          width: bottomIconSize, height: bottomIconSize),
      title: Container(
          margin: EdgeInsets.only(top: 4.0),
          child: Text(title,
              style: TextStyle(fontSize: 10.0, color: Color(0xFF888888)))),
    );
  }

  @override
  void initState() {
    super.initState();
    currentPage = pageList[currentIndex];
  }

  onTabSelected(index) {
    setState(() {
      currentIndex = index;
      currentPage = pageList[currentIndex];
    });

    HttpRequest.instance().post("/functions/home", (RequestData requestData) {
      print("${requestData.toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabList,
        onTap: onTabSelected,
      ),
      body: currentPage,
    );
  }
}
