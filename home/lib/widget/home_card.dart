import 'package:flutter/material.dart';
import 'package:home/entity/home_data.dart';
import 'package:base/util/util.dart';
import 'package:home/widget/card/TinderSwapCard.dart';

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
      height: 205.0,
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
//           child: testAlgin(),
          ),
        ],
      ),
    );
  }

  pageWidget() => ClipRRect(
        borderRadius: new BorderRadius.circular(8.0),
        child: Image.network(
          homeItem.pagerItems[0]?.imageUrl,
          height: 104,
        ),
      );

  plainWidget() => Container(
        height: 82,
        margin: EdgeInsets.only(top: 6),
        child: Row(
          children: <Widget>[
            Expanded(
                child: ClipRRect(
              borderRadius: new BorderRadius.circular(8.0),
              child: new AspectRatio(
                aspectRatio: 1,
                child: Image.network(homeItem.plainItems[0]?.imageUrl), //项目资源文件
              ),
            )),
            Container(
              width: 5,
            ),
            Expanded(
                child: ClipRRect(
              borderRadius: new BorderRadius.circular(8.0),
              child: new AspectRatio(
                aspectRatio: 1,
                child: Image.network(homeItem.plainItems[1]?.imageUrl), //项目资源文件
              ),
            )),
          ],
        ),
      );

  cardWidget() => Container(
      height: 205,
      child: Image.network(homeItem.cardItems[0]?.imageUrl),
      margin: EdgeInsets.only(left: 5));

  Widget magicCard() {
    if (isEmpty(homeItem.cardItems)) {
      return null;
    }
    var width = (MediaQuery.of(context).size.width - 29) / 2;
    return new TinderSwapCard(
        totalNum: homeItem.cardItems.length,
        maxWidth: width,
        maxHeight: 193,
        cardBuilder: (context, index) {
          return Image.network(homeItem.cardItems[index].imageUrl,
              fit: BoxFit.cover);
        },
        cardController: CardController(),
        swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
          print("orientation=${orientation.toString()}  index=$index");
        });
  }

  Widget testAlgin() {
    var width = (MediaQuery.of(context).size.width - 29) / 2;
    return Container(
      color: Colors.black,
      width: (MediaQuery.of(context).size.width - 29) / 2,
      height: 205,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0, 1),
            child: SizedBox.fromSize(
              size: Size(width - 12, 152),
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.75),
            child: SizedBox.fromSize(
              size: Size(width - 6, 163),
              child: Container(
                color: Colors.blueAccent,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, -1),
            child: SizedBox.fromSize(
              size: Size((MediaQuery.of(context).size.width - 29) / 2, 193),
              child: Container(
                color: Colors.amber,
              ),
            ),
          )
        ],
      ),
    );
  }
}
