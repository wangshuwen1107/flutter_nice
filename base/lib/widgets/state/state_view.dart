import 'package:base/widgets/state/empty_view.dart';
import 'package:base/widgets/state/error_view.dart';
import 'package:base/widgets/state/loading_view.dart';
import 'package:flutter/material.dart';

enum Status { empty, loading, error, normal }

class StateView extends StatelessWidget {
  final Status status;
  final Widget child;
  final VoidCallback errorClick;

  StateView({this.status = Status.normal, this.child, this.errorClick});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case Status.normal:
        return child;
      case Status.empty:
        return EmptyView();
      case Status.loading:
        return LoadingView();
      case Status.error:
        return ErrorView(
          errorClick: errorClick,
        );
    }
    return child;
  }
}
