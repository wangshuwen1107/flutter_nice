import 'package:base/constant/strings.dart';
import 'package:base/widgets/icon_font.dart';
import 'package:base/widgets/x_listview.dart';
import 'package:flutter/material.dart';
import 'package:base/api/mine_api.dart';
import 'package:base/entity/mine/mine_item_bean.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> with AutomaticKeepAliveClientMixin{
  List<MineItemBean> mineItems = [];

  @override
  void initState() {
    super.initState();
    getMineItems();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Column(
        children: <Widget>[topWidget(), listView()],
      ),
    );
  }

  getMineItems() {
    MineApi.instance().getMineItem(context).then((List<MineItemBean> items) {
      for (var item in items) {
        print('getMineItems = ${item.toJson()}');
      }
      setState(() {
        mineItems = items;
      });
    });
  }

  listView() {
    return Expanded(
        child: XListView(
      itemCount: mineItems.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (0 == index) {
          return userHeader();
        } else {
          return mineItem(mineItems[index - 1]);
        }
      },
    ));
  }

  mineItem(MineItemBean mineItemBean) {
    return Container(
        padding: EdgeInsets.only(left: 22, right: 22),
        height: 60,
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: <Widget>[
            Image.asset(mineItemBean.iconRes, width: 22, height: 22),
            Positioned(
              child: Text(mineItemBean.name),
              left: 30,
            ),
            Positioned(
              child: (IconFont(
                IconFonts.next,
                size: 12,
              )),
              right: 0,
            )
          ],
        ));
  }

  userHeader() {
    return Container(
      height: 100,
    );
  }

  topWidget() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 30,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Positioned(
            right: 72,
            child: IconFont(
              IconFonts.mineShare,
              size: 20,
            ),
          ),
          Positioned(
            right: 22,
            child: IconFont(
              IconFonts.setting,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
