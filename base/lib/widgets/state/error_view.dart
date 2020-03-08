import 'package:flutter/material.dart';

class ErrorView extends StatefulWidget {
  final String title;

  final VoidCallback errorClick;

  ErrorView({this.title = "网络连接异常", this.errorClick});

  @override
  _ErrorViewState createState() => _ErrorViewState();
}

class _ErrorViewState extends State<ErrorView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: IntrinsicHeight(
          child: Column(
            children: <Widget>[
              SizedBox.fromSize(
                child: Image.asset("assets/images/common_state_error.png"),
                size: Size(314, 276),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              )
            ],
          ),
        ),
        onTap: widget.errorClick,
      ),
    );
  }
}
