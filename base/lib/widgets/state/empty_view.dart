import 'package:flutter/material.dart';

class EmptyView extends StatefulWidget {
  final String title;

  EmptyView({this.title = "Empty"});

  @override
  _EmptyViewState createState() => _EmptyViewState();
}

class _EmptyViewState extends State<EmptyView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IntrinsicHeight(
        child: Column(
          children: <Widget>[
            SizedBox.fromSize(
              child: Image.asset("assets/images/common_state_empty.png"),
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
    );
  }
}
