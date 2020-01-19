import 'package:base/entity/home/home_data.dart';
import 'package:flutter/material.dart';
import 'package:base/util/util.dart';
import 'package:home/items/home_banner_item.dart';
import 'package:home/items/home_head.dart';

class DingChaoPage extends StatefulWidget {
  final HomeData homeData;

  @override
  _DingChaoPageState createState() => _DingChaoPageState();

  DingChaoPage(this.homeData);
}

class _DingChaoPageState extends State<DingChaoPage> {
  HomeData homeData;

  List<Map<String, dynamic>> itemList = [];

  static const int BANNER_TYPE = 0;
  static const int PAGE_TYPE = 1;
  static const int POST_TYPE = 2;

  @override
  void initState() {
    super.initState();
    homeData = widget.homeData;
  }

  @override
  Widget build(BuildContext context) {
    homeData = widget.homeData;
    return Container(
        color: Color(0xF7F7F9FF),
        child: ListView.builder(
          itemCount: getItemCount(),
          itemBuilder: (BuildContext context, int index) {
            switch (itemList[index]['viewType']) {
              case BANNER_TYPE:
                return HomeBannerItem(itemList[index]['data']);
              case PAGE_TYPE:
                return HomeCard(homeItem: itemList[index]['data']);
            }
            return null;
          },
        ));
  }

  int getItemCount() {
    if (isEmpty(homeData)) {
      return 0;
    }
    itemList.clear();
    HomeItem homeItem = homeData.items;
    if (!isEmpty(homeItem)) {
      if (!isEmpty(homeItem.pagerItems) ||
          !isEmpty(homeItem.plainItems) ||
          !isEmpty(homeItem.cardItems)) {
        itemList.add({'viewType': PAGE_TYPE, 'data': homeItem});
      }
      if (!isEmpty(homeItem.bannerItems)) {
        itemList.add({'viewType': BANNER_TYPE, 'data': homeItem.bannerItems});
      }
    }
    return itemList.length;
  }
}
