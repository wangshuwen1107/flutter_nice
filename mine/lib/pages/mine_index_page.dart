import 'package:base/constant/strings.dart';
import 'package:base/util/util.dart';
import 'package:base/widgets/icon_font.dart';
import 'package:base/widgets/x_listview.dart';
import 'package:flutter/material.dart';
import 'package:base/api/mine_api.dart';
import 'package:base/entity/mine/mine_item_bean.dart';
import 'package:flutter/widgets.dart';
import 'package:router_plugin/router_plugin.dart';
import 'package:base/api/common_api.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> with AutomaticKeepAliveClientMixin{
  List<MineItemBean> mineItems = [];

//  Map userInfo = {"infoDes": "会员已过期", "nickName": "Giao", "vipStatus": false};
  Map userInfo;

  @override
  void initState() {
    super.initState();
    getMineItems();
    getUser();
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

  getUser() {
    RouterPlugin.method('account/getUser').then((user) {
      print('getUser = $user');
      setState(() {
        userInfo = user;
      });
    });
  }

  routeToLogin() {
    RouterPlugin.page('account/index').then((val) {
      print("routeToLogin   ---$val");
    });
  }

  routeToVip() {
    CommonApi.instance().getCloudUrl('vipCharge').then((res) {
      print('======res=$res');
      RouterPlugin.page('browser/internal', {"url": res['url']}).then((val) {
        print("routeToVip   ---$val");
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
    print("render userHeader is called $userInfo");
    if (null == userInfo) {
      return Container(
        margin: EdgeInsets.only(top: 20, left: 22, bottom: 20),
        child: GestureDetector(
          child: Text(
            "登录",
            style: TextStyle(
                fontSize: 20,
                color: Color(0xFF373E4D),
                fontWeight: FontWeight.bold),
          ),
          onTap: routeToLogin,
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          children: <Widget>[basicInfoWidget(), vipWidget()],
        ),
      );
    }
  }

  basicInfoWidget() {
    return Container(
      margin: EdgeInsets.only(left: 22, right: 22),
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                userInfo['nickName'],
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF373E4D),
                    fontWeight: FontWeight.bold),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  padding:
                      EdgeInsets.only(left: 7, right: 14, top: 2, bottom: 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.circular(12),
                    border: Border.all(width: 1, color: Color(0X80979797)),
                  ),
                  child: IntrinsicWidth(
                      child: Row(
                    children: <Widget>[
                      Image.asset("assets/images/mine_integral_balance.png",
                          width: 17, height: 17),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          userInfo['integral'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF373E4D),
                          ),
                        ),
                      ),
                    ],
                  ))),
            ],
          ),
          Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                  image: isEmpty(userInfo['avatarUrl'])
                      ? null
                      : DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(userInfo['avatarUrl'])),
                ),
              ))
        ],
      ),
    );
  }

  vipWidget() {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 12, right: 12),
      padding: EdgeInsets.only(left: 18, right: 18),
      height: 68,
      width: double.infinity,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(4),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFF4E7CC), Color(0xFFF5E7CB)])),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("VIP会员",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFAE7E4F),
                  )),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(userInfo['infoDes'],
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFAE7E4F),
                    )),
              ),
            ],
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(4),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFFF3CA9B), Color(0xFFAE7E4F)])),
              child: GestureDetector(
                child: Text(
                  userInfo['hasVip'] ? "立即续费" : "立即开通",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                onTap: routeToVip,
              ),
            ),
            right: 0,
          )
        ],
      ),
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
