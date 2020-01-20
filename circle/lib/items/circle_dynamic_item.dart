import 'dart:ui';

import 'package:base/constant/strings.dart';
import 'package:base/entity/circle/circle_dynamic_bean.dart';
import 'package:base/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:base/widgets/icon_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart' as intl;
import 'package:transparent_image/transparent_image.dart';

class CircleDynamicItem extends StatefulWidget {
  final CircleDynamicBean dynamicBean;

  CircleDynamicItem(this.dynamicBean, {Key key}) : super(key: key);

  @override
  _CircleDynamicState createState() => _CircleDynamicState();
}

class _CircleDynamicState extends State<CircleDynamicItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(20, 20, 14, 12),
        margin: EdgeInsets.only(
          bottom: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getUserHeadWidget(),
            getContentTxtWidget(),
            getImageWidget()
          ],
        ));
  }

  /// 动态用户信息
  getUserHeadWidget() {
    CircleUserBean userBean = widget.dynamicBean?.user;
    if (null == userBean) {
      return Container(width: 0, height: 0);
    }
    return Container(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(userBean.avatarUrl ?? ""))),
        ),
        Container(
          height: 1,
          width: 12,
        ),
        Expanded(
          child: Container(
            height: 46,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  userBean.nickName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15, color: Color(0xFF797F8C)),
                ),
                Text(
                  getTimeStr(widget.dynamicBean.createdAt),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15, color: Color(0xFF797F8C)),
                ),
              ],
            ),
          ),
        ),
        IconFont(IconFonts.more),
      ],
    ));
  }

  /// 文本内容
  getContentTxtWidget() {
    String content = widget.dynamicBean?.content;
    if (isEmpty(content)) {
      return Container(width: 0, height: 0);
    }
    TextStyle textStyle = TextStyle(fontSize: 15, color: Color(0xFF373D4D));
    TextSpan textSpan = TextSpan(text: content, style: textStyle);
    TextPainter textPainter = TextPainter(
        text: textSpan, maxLines: 6, textDirection: TextDirection.ltr);
    textPainter.layout(maxWidth: MediaQuery.of(context).size.width - 34);
    return Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: textPainter.didExceedMaxLines
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    content,
                    style: textStyle,
                    maxLines: 6,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      '全部',
                      softWrap: true,
                      style: TextStyle(fontSize: 15, color: Color(0xFF3385FE)),
                    ),
                  ),
                ],
              )
            : Text(
                content,
                style: textStyle,
                maxLines: 6,
                softWrap: true,
                overflow: TextOverflow.visible,
              ));
  }

  ///图片信息
  getImageWidget() {
    List<CircleImageBean> imageList = widget.dynamicBean?.images;
    if (isEmpty(imageList)) {
      return Container(width: 0, height: 0);
    }
    if (imageList.length == 1) {
      int width = imageList[0].width;
      int height = imageList[0].height;
      return Container(
        width: width <= 0 || height <= 0
            ? 190
            : width > height ? 190 : 190 * width / height,
        height: width <= 0 || height <= 0
            ? 190
            : width > height ? 190 * height / width : 190,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            border: Border.all(width: 1, color: Color(0xFFF5F5F5)),
            image: DecorationImage(
                image: NetworkImage(imageList[0].url), fit: BoxFit.cover)),
      );
    }

    List<Widget> viewList = [];
    for (CircleImageBean imageBean in imageList) {
      viewList.add(
        Container(
            decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          border: Border.all(width: 1, color: Color((0xFFF5F5F5))),
          image: DecorationImage(
              image: NetworkImage(imageBean.url), fit: BoxFit.cover),
        )),
      );
    }
    if (viewList.length == 4) {
      viewList.insert(2, Container());
      viewList.insert(5, Container());
    }
    return Container(
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1,
        children: viewList,
        shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
    );
  }

  String getTimeStr(int timestamp) {
    int currentTimeMillis = new DateTime.now().millisecondsSinceEpoch;
    int reduceTime = (currentTimeMillis - timestamp);
    if (reduceTime < 300) {
      return "刚刚";
    }
    double minutes = reduceTime / 60;
    if (minutes < 60) {
      return '$minutes分钟前';
    }
    double hours = reduceTime / 3600;
    if (hours < 24) {
      return "$hours小时前";
    }
    double days = reduceTime / 3600 / 24;
    if (days < 10) {
      return "$days天前";
    }
    var format = new intl.DateFormat('MM/dd HH:mm');
    var date = new DateTime.fromMicrosecondsSinceEpoch(timestamp);
    return format.format(date);
  }
}
