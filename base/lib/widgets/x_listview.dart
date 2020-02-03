import 'package:base/constant/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef LoadMoreCallback = Future<void> Function();
typedef LoadMoreErrorCallback = Future<void> Function();

class XListView extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final LoadMoreCallback onError;
  final LoadMoreCallback onLoadMore;

  @override
  _XListViewState createState() => _XListViewState();

  XListView({
    @required this.itemBuilder,
    this.onLoadMore,
    this.itemCount = 0,
    this.onError,
  });
}

enum LoadMoreStatus { idle, loading, done, error }

class _XListViewState extends State<XListView> {
  LoadMoreStatus status = LoadMoreStatus.idle;
  ScrollController _mController = ScrollController();

  @override
  void initState() {
    super.initState();
    _mController.addListener(() {
      if (_mController.position.pixels >=
          _mController.position.maxScrollExtent) {
        _onLoadMoreIng();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.itemCount + 1,
      controller: _mController,
      itemBuilder: (BuildContext context, int index) {
        if (index == widget.itemCount) {
          return _buildLoadMoreItem();
        } else {
          return widget.itemBuilder(context, index);
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _mController.dispose();
  }

  Widget _buildLoadMoreItem() {
    var contentView;
    switch (status) {
      case LoadMoreStatus.idle:
      case LoadMoreStatus.loading:
        contentView = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(Color(ColorRes.theme)),
                strokeWidth: 2.0,
              ),
              height: 20.0,
              width: 20.0,
            ),
            Container(
              width: 20,
            ),
            Text('正在加载...'),
          ],
        );
        break;
      case LoadMoreStatus.done:
        contentView = Text('已经到底了~');
        break;
      case LoadMoreStatus.error:
        contentView = InkWell(
          child: Text('加载出错~'),
          onTap: _onErrorTap,
        );
        break;
    }
    return Container(
      height: 40,
      child: Center(
        child: contentView,
      ),
    );
  }

  _onLoadMoreIng() {
    print('onloadmore  进入 status =${status.toString()}');
    if (status != LoadMoreStatus.loading) {
      print('onloadmore  ing ------------');
      setState(() {
        status = LoadMoreStatus.loading;
      });
      widget.onLoadMore()?.then((data) {
        print('onloadmore whenComplete ------------');
        setState(() {
          status = LoadMoreStatus.idle;
        });
      })?.catchError((error) {
        print('onloadmore catchError ------------');
        setState(() {
          status = LoadMoreStatus.error;
        });
      });
    }
  }

  _onErrorTap() {
    setState(() {
      status = LoadMoreStatus.loading;
    });
    widget.onError()?.then((data) {
      print('onError whenComplete ------------');
      setState(() {
        status = LoadMoreStatus.idle;
      });
    })?.catchError((error) {
      print('onError catchError ------------');
      setState(() {
        status = LoadMoreStatus.error;
      });
    });
  }
}
