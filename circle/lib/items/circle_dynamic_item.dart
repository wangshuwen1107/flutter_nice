import 'package:base/entity/circle/circle_dynamic_bean.dart';
import 'package:flutter/cupertino.dart';
import 'package:base/widgets/icon_font.dart';
import 'package:intl/intl.dart';

class CircleDynamicItem extends StatefulWidget {
  final CircleDynamicBean dynamicBean;

  CircleDynamicItem(this.dynamicBean, {Key key}) : super(key: key);

  @override
  _CircleDynamicState createState() => _CircleDynamicState();
}

class _CircleDynamicState extends State<CircleDynamicItem> {
  @override
  Widget build(BuildContext context) {
    return Container(child: getUserHeadWidget());
  }

  getUserHeadWidget() {
    CircleUserBean userBean = widget.dynamicBean?.user;
    if (null == userBean) {
      return Container(width: 0, height: 0);
    }
    return Container(
        child: Row(
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
          height: 12,
        ),
        Column(
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
        )
      ],
    ));
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
    var format = new DateFormat('MM/dd HH:mm');
    var date = new DateTime.fromMicrosecondsSinceEpoch(timestamp);
    return format.format(date);
  }
}
