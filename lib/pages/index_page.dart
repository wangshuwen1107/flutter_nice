import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home_page.dart';
import 'category_page.dart';
import 'cart_page.dart';
import 'member_page.dart';
import 'package:dio/dio.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List<BottomNavigationBarItem> bottomTabList = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text("首页1")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.bookmark_solid), title: Text("分类")),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.car), title: Text("car")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.person), title: Text("个人"))
  ];

  List pageList = [HomePage(), CategoryPage(), CartPage(), MemberPage()];

  var currentIndex = 0;
  var currentPage;

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
    getRequest();
  }

  //so easy
  getRequest() async {
    try {
      Response response = await Dio().get("https://www.easy-mock.com/mock/5e1aa40eedb71e73148360dc/sunshine/home");
      print(response);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          items: bottomTabList,
          fixedColor: Colors.lightBlue,
          onTap: onTabSelected,
      ),
      body: currentPage,
    );
  }
}
