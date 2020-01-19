import 'package:flutter/cupertino.dart';

class IconFont extends Icon {
  final int iconInt;

  IconFont(this.iconInt,
      {Color color,
      double size,
      String semanticLabel,
      TextDirection textDirection})
      : super(IconData(iconInt, fontFamily: 'iconfont'),
            color: color,
            size: size,
            semanticLabel: semanticLabel,
            textDirection: textDirection);
}
