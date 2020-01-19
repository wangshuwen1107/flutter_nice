import 'package:base/entity/home/home_data.dart';
import 'package:flutter/material.dart';
import 'package:base/util/util.dart';
import 'package:home/widget/banner_widget.dart';

class HomeCard extends StatefulWidget {
  final HomeItem homeItem;

  const HomeCard({Key key, this.homeItem}) : super(key: key);

  @override
  _HomeCardState createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> with TickerProviderStateMixin {
  HomeItem homeItem;

  @override
  void initState() {
    super.initState();
    homeItem = widget.homeItem;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
      height: 193.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[pageWidget(), plainWidget()],
            ),
          ),
          Container(
            width: 5,
          ),
          Expanded(
            child: magicCard(),
          ),
        ],
      ),
    );
  }

  int pageIndex = 0;

  pageWidget() {
    if (isEmpty(homeItem.pagerItems)) {
      return Container(
        height: 104,
      );
    }
    return Container(
        height: 104,
        child: Stack(
          children: <Widget>[
            PageView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: new BorderRadius.circular(8.0),
                  child: Image.network(
                    homeItem.pagerItems[index].imageUrl,
                    fit: BoxFit.cover,
                    height: 104,
                  ),
                );
              },
              itemCount: homeItem.pagerItems.length,
              onPageChanged: (int index) {
                setState(() {
                  pageIndex = index;
                });
              },
            ),
            homeItem.pagerItems.length > 1
                ? Positioned(
                    child: Text(
                      '${pageIndex + 1}/${homeItem.pagerItems.length}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    right: 10,
                    top: 7,
                  )
                : Container(
                    width: 0,
                    height: 0,
                  )
          ],
        ));
  }

  plainWidget() => Container(
        height: 82,
        margin: EdgeInsets.only(top: 6),
        child: Row(
          children: <Widget>[
            plainWidgetChild(
                homeItem.plainItems.length > 0 ? homeItem.plainItems[0] : null),
            Container(
              width: 5,
            ),
            plainWidgetChild(
                homeItem.plainItems.length > 1 ? homeItem.plainItems[1] : null),
          ],
        ),
      );

  plainWidgetChild(HomeHeadCommonBean item) => Expanded(
          child: ClipRRect(
        borderRadius: new BorderRadius.circular(8.0),
        child: new AspectRatio(
          aspectRatio: 1,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Image.network(
                item?.imageUrl,
                fit: BoxFit.cover,
              ),
              Text(item?.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ), //项目资源文件
        ),
      ));

  cardWidget() => Container(
      height: 193,
      child: Image.network(homeItem.cardItems[0]?.imageUrl),
      margin: EdgeInsets.only(left: 5));

  Widget magicCard() {
    if (isEmpty(homeItem.cardItems)) {
      return null;
    }
    List<Widget> widgetList = [];
    for (HomeHeadCommonBean entity in homeItem.cardItems) {
      widgetList.add(Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ClipRRect(
            borderRadius: new BorderRadius.circular(8.0),
            child: Image.network(
              entity.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            child: Text(
              entity.title,
              maxLines: 3,
              style: TextStyle(fontSize: 13.0, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
            bottom: 12.0,
            left: 12.0,
            right: 12.0,
          ),
          Positioned(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0)),
              child: Container(
                decoration: BoxDecoration(
                  gradient: new LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(hexStringToHexInt(
                            entity.badge?.startColor ?? '#C47BFF')),
                        Color(hexStringToHexInt(
                            entity.badge?.endColor ?? '#FF8FF1'))
                      ]),
                ),
                padding:
                    EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 15),
                child: Text(
                  entity.badge?.title,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            top: 0,
            left: 0,
          )
        ],
      ));
    }
    return BannerWidget(193, widgetList);
  }
}
