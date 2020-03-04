import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'monitoring_page.dart';
import 'circle_page.dart';
import 'package:mine/pages/mine_index_page.dart';
import 'compare_page.dart';
import 'package:home/pages/home_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  static const bottomIconSize = 28.0;
  List<Widget> pageList = [
    HomePage(),
    MonitoringPage(),
    CirclePage(),
    ComparePage(),
    MinePage()
  ];
  var currentIndex = 0;

  List<BottomNavigationBarItem> bottomTabList = [
    _buildBarItem("首页", "assets/images/tabbar_home_light.png",
        "assets/images/tabbar_home_dark.png"),
    _buildBarItem("监控", "assets/images/tabbar_monitoring_light.png",
        "assets/images/tabbar_monitoring_dark.png"),
    _buildBarItem("比价", "assets/images/tabbar_compare_light.png",
        "assets/images/tabbar_compare_dark.png"),
    _buildBarItem("圈子", "assets/images/tabbar_circle_light.png",
        "assets/images/tabbar_circle_dark.png"),
    _buildBarItem("我的", "assets/images/tabbar_me_light.png",
        "assets/images/tabbar_me_dark.png")
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
  }

  onTabSelected(index) {
    setState(() {
      currentIndex = index;
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
      body: IndexedStack(
        index: currentIndex,
        children: pageList,
      ),
    );
  }
}
