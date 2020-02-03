import 'package:base/entity/circle/circle_dynamic_bean.dart';
import 'package:base/entity/home/home_data.dart';
import 'package:base/entity/request_data.dart';
import 'package:base/request/http_request.dart';
import 'package:flutter/material.dart';
import 'package:base/util/util.dart';
import 'package:home/items/home_banner_item.dart';
import 'package:home/items/home_head.dart';
import 'package:circle/items/circle_dynamic_item.dart';

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

  ScrollController _mController = ScrollController();

  @override
  void initState() {
    super.initState();
    homeData = widget.homeData;
  }

  @override
  Widget build(BuildContext context) {
    homeData = widget.homeData;
//    _mController.addListener(() {
//      print('---');
//    });
    return Container(
      color: Color(0xF7F7F9FF),
      child: RefreshIndicator(
        onRefresh: getHomeData,
        child: ListView.builder(
          //shrinkWrap: true,
          itemCount: getItemCount(),
          itemBuilder: (BuildContext context, int index) {
            switch (itemList[index]['viewType']) {
              case BANNER_TYPE:
                return HomeBannerItem(itemList[index]['data']);
              case PAGE_TYPE:
                return HomeCard(homeItem: itemList[index]['data']);
              case POST_TYPE:
                return CircleDynamicItem(itemList[index]['data']);
            }
            return null;
          },
          controller: _mController,
        ),
      ),
    );
  }

  Future getHomeData() {
    return HttpRequest.instance().post("/functions/home").then((response) {
      setState(() {
        homeData = HomeData.fromJson(response.data);
      });
    });
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
      if (!isEmpty(homeData.posts)) {
        for (CircleDynamicBean circleDynamicBean in homeData.posts) {
          itemList.add({'viewType': POST_TYPE, 'data': circleDynamicBean});
        }
      }
    }
    return itemList.length;
  }
}
