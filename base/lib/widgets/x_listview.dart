import 'package:base/constant/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef LoadMoreCallback = Future<LoadMoreStatus> Function();

class XListView extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final LoadMoreCallback onLoadMore;

  @override
  _XListViewState createState() => _XListViewState();

  XListView({@required this.itemBuilder, this.onLoadMore, this.itemCount = 0});
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
      itemCount:
          null == widget.onLoadMore ? widget.itemCount : widget.itemCount + 1,
      controller: _mController,
      itemBuilder: (BuildContext context, int index) {
        if (index == widget.itemCount && null != widget.onLoadMore) {
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
          onTap: _onLoadMoreIng,
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
    if (status != LoadMoreStatus.loading) {
      print('onloadmore  ing ------------');
      _changeStatus(LoadMoreStatus.loading);
      widget.onLoadMore()?.then((data) {
        print('onloadmore whenComplete ------------');
        _changeStatus(data);
      })?.catchError((error) {
        print('onloadmore catchError ------------');
        _changeStatus(LoadMoreStatus.error);
      });
    }
  }

  _changeStatus(newStatus) {
    print('_changeStatus  status =${newStatus.toString()}');
    setState(() {
      status = newStatus;
    });
  }
}
