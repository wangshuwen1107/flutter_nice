import 'package:flutter/cupertino.dart';
import 'package:base/util/util.dart';
import 'package:home/entity/home_data.dart';
import 'package:home/widget/banner.dart';

class HomeBannerItem extends StatefulWidget {
  final List<HomeBanner> bannerItems;

  HomeBannerItem(this.bannerItems, {Key key})
      : assert(!isEmpty(bannerItems)),
        super(key: key);

  @override
  _HomeBannerState createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBannerItem> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    for (HomeBanner entity in widget.bannerItems) {
      widgetList.add(ClipRRect(
        borderRadius: new BorderRadius.circular(8.0),
        child: Image.network(
          entity.imageUrl,
          fit: BoxFit.cover,
        ),
      ));
    }
    return Container(
      margin: EdgeInsets.fromLTRB(12, 10, 12, 0),
      child: BannerWidget(82, widgetList, hasPoint: true),
    );
  }
}
