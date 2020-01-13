import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  TextEditingController typeController = TextEditingController();

  String holderTxt = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("雪儿"),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              controller: typeController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                labelText: "labelText",
                helperText: "helperText",
              ),
              autofocus: false,
              scrollPadding: EdgeInsets.all(10.0),
            ),
            RaisedButton(
              child: Text("确定"),
              onPressed: _onConfirm,
            ),
            Text(
              "你的结果$holderTxt",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }

  _onConfirm() {
    if (typeController.text.toString() == '') {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("请输入值~"),
              ));
      return;
    }
    getHttp().then((val) {
      print("请求后的结果 ${val}");
      setState(() {
        holderTxt = val;
      });
    });
  }

  Future getHttp() async {
    print('getHttp is called');
    Response response;
    try {
      response = await Dio().get("https://www.baidu.com");
      return response.data;
    } catch (e) {
      return e.toString();
    }
  }
}
