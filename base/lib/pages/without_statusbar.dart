import 'package:flutter/material.dart';
import 'dart:math' as math;

class WithoutStatusBar extends StatelessWidget {
  final Widget child; //布局
  final Color color; //背景颜色

  static const Color defaultColor = Color(0xFFF7F7F9);

  WithoutStatusBar({@required this.child, this.color = defaultColor});

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    double top = math.max(padding.top, EdgeInsets.zero.top);
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: top,
          color: color,
        ),
        Expanded(child: child),
      ],
    );
  }
}
