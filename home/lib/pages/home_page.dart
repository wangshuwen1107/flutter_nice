import 'package:base/entity/home/home_data.dart';
import 'package:flutter/material.dart';
import 'home_dingchao_page.dart';
import 'package:base/api/home_api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getHomeData();
  }

  HomeData _homeData;

  @override
  Widget build(BuildContext context) {
    if (null == _homeData) {
      return Container();
    }
    return DefaultTabController(
        length: getTabSize(),
        child: Scaffold(
          appBar: PreferredSize(
              child: AppBar(
                flexibleSpace: SafeArea(
                  child: getTabContainer(),
                ),
                backgroundColor: Color(0xFFF7F7F9),
                elevation: 0,
              ),
              preferredSize: Size.fromHeight(50)),
          body: DingChaoPage(_homeData),
        ));
  }

  List<Widget> getTabContentViewList() {
    List<Widget> viewList = [];
    for (int i = 0; i < getTabSize(); i++) {
      if (i == 0) {
        viewList.add(DingChaoPage(_homeData));
      } else {
        viewList.add(Icon(Icons.directions_bike));
      }
    }
    return viewList;
  }

  int getTabSize() {
    if (null == _homeData || null == _homeData.categories) {
      return 1;
    }
    return 1 + _homeData.categories.length;
  }

  getTabContainer() {
    List<Widget> tabList = [];
    for (int i = 0; i < getTabSize(); i++) {
      if (i == 0) {
        tabList.add(Tab(
          child: Text(
            '首页',
            maxLines: 1,
          ),
        ));
        continue;
      }
      var category = _homeData.categories[i - 1];
      tabList.add(Tab(
        child: Text(
          category.name,
          maxLines: 1,
        ),
      ));
    }
    return Container(
      alignment: Alignment.topLeft,
      height: 50,
      color: Color(0xFFF7F7F9),
      child: TabBar(
        indicator: const BoxDecoration(),
        tabs: tabList,
        isScrollable: true,
        labelColor: Color(0xFF373E4D),
        unselectedLabelColor: Color(0xFF797F8C),
        labelStyle: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        unselectedLabelStyle:
            TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
      ),
    );
  }

  void getHomeData() {
    HomeApi.instance().getHomeData().then((data) {
      setState(() {
        _homeData = data;
      });
    });
  }
}
