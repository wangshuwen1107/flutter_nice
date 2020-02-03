import 'package:base/entity/circle/circle_dynamic_bean.dart';
import 'package:base/entity/home/home_data.dart';
import 'package:base/api/home_api.dart';
import 'package:flutter/material.dart';
import 'package:base/util/util.dart';
import 'package:home/items/home_banner_item.dart';
import 'package:home/items/home_head.dart';
import 'package:circle/items/circle_dynamic_item.dart';
import 'package:base/widgets/x_listview.dart';

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
      child: RefreshIndicator(
        onRefresh: getHomeData,
        child: XListView(
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
          onLoadMore: loadMoreData,
          onError: loadMoreData,
        ),
      ),
    );
  }

  Future getHomeData() {
    return HomeApi.instance()
        .getHomeData()
        .then((HomeData data) => setState(() {
              homeData = data;
            }));
  }

  Future loadMoreData() {
    print('DingChao Home Load More  --------');
    return HomeApi.instance()
        .recommendPosts(homeData.posts?.nextKey)
        .then((HomePostData data) => setState(() {
              if (isEmpty(data.posts)) {
                /// 加载到最后了~~ 待处理
                return;
              }
              homeData.posts.posts.addAll(data.posts);
              homeData.posts.nextKey = data.nextKey;
            }));
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
      if (!isEmpty(homeData.posts) && !isEmpty(homeData.posts.posts)) {
        for (CircleDynamicBean circleDynamicBean in homeData.posts.posts) {
          itemList.add({'viewType': POST_TYPE, 'data': circleDynamicBean});
        }
      }
    }
    print('itemCount = ${itemList.length}');
    return itemList.length;
  }
}
