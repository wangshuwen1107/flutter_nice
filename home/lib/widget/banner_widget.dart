import 'dart:async';

import 'package:flutter/material.dart';

const MAX_COUNT = 0x7fffffff;

typedef void OnBannerItemClick(int position);

class BannerWidget extends StatefulWidget {
  final double height;
  final List<Widget> datas;
  int duration;
  double pointRadius;
  Color selectedColor;
  Color unSelectedColor;
  bool hasPoint;

  OnBannerItemClick bannerPress;
  static const DEFAULT_UN_SELECTED_COLOR = Color(0x66FFFBFB);

  BannerWidget(
    this.height,
    this.datas, {
    Key key,
    this.duration = 5000,
    this.pointRadius = 3.0,
    this.hasPoint = false,
    this.selectedColor = Colors.white,
    this.unSelectedColor = DEFAULT_UN_SELECTED_COLOR,
    this.bannerPress,
  }) : super(key: key);

  @override
  BannerState createState() {
    return new BannerState();
  }
}

class BannerState extends State<BannerWidget> {
  Timer timer;
  int selectedIndex = 0;
  PageController controller;

  @override
  void initState() {
    double current = widget.datas.length > 0
        ? (MAX_COUNT / 2) - ((MAX_COUNT / 2) % widget.datas.length)
        : 0.0;
    controller = PageController(initialPage: current.toInt());
    _initPageAutoScroll();
    super.initState();
  }

  _initPageAutoScroll() {
    start();
  }

  @override
  void didUpdateWidget(BannerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    //print('didUpdateWidget----------------------banner');
  }

  start() {
    stop();
    timer = Timer.periodic(Duration(milliseconds: widget.duration), (timer) {
      if (widget.datas.length > 0 &&
          controller != null &&
          controller.page != null) {
        controller.animateToPage(controller.page.toInt() + 1,
            duration: Duration(milliseconds: 300), curve: Curves.linear);
      }
    });
  }

  stop() {
    timer?.cancel();
    timer = null;
  }

  @override
  void dispose() {
    stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: widget.height,
      child: Stack(
        children: <Widget>[
          getViewPager(),
          new Align(
            alignment: Alignment.bottomCenter,
            child: IntrinsicHeight(
              child: Container(
                child: getBannerPointWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getViewPager() {
    return PageView.builder(
      itemCount: widget.datas.length > 0 ? MAX_COUNT : 0,
      controller: controller,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        var realIndex = index % widget.datas.length;
        var child = InkWell(
            onTap: () {
              if (widget.bannerPress != null) widget.bannerPress(selectedIndex);
            },
            child: widget.datas[realIndex]);
        return child;
      },
    );
  }

  Widget getBannerPointWidget() {
    if (!widget.hasPoint) {
      return Container(width: 0, height: 0);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: circle(),
    );
  }

  List<Widget> circle() {
    List<Widget> circle = [];
    for (var i = 0; i < widget.datas.length; i++) {
      circle.add(Container(
        margin: EdgeInsets.fromLTRB(3, 0, 3, 6),
        width: widget.pointRadius * 2,
        height: widget.pointRadius * 2,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: selectedIndex == i
              ? widget.selectedColor
              : widget.unSelectedColor,
        ),
      ));
    }
    return circle;
  }

  onPageChanged(index) {
    selectedIndex = index % widget.datas.length;
    setState(() {});
  }
}
