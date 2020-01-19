import 'package:base/entity/circle/circle_dynamic_bean.dart';
import 'package:flutter/cupertino.dart';
import 'package:base/widgets/icon_font.dart';

class CircleDynamicItem extends StatefulWidget {

  final CircleDynamicBean dynamicBean;

  CircleDynamicItem(this.dynamicBean, {Key key}) : super(key: key);

  @override
  _CircleDynamicState createState() => _CircleDynamicState();
}

class _CircleDynamicState extends State<CircleDynamicItem> {
  @override
  Widget build(BuildContext context) {
    return Container(child: IconFont(123),);
  }


}
