import 'package:base/entity/mine/mine_item_bean.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class MineApi {
  static MineApi _instance;

  static _getInstance() {
    if (_instance == null) {
      _instance = MineApi._internal();
    }
    return _instance;
  }

  MineApi._internal();

  //工厂方法给外部
  factory MineApi.instance() => _getInstance();

  Future<List<MineItemBean>> getMineItem(BuildContext context) {
    return DefaultAssetBundle.of(context)
        .loadString("assets/mine_item.json")
        .then((val) {
      List<dynamic> mapList = json.decode(val);
      List<MineItemBean> itemList = [];
      for (var map in mapList) {
        itemList.add(MineItemBean.fromJson(map));
      }
      return itemList;
    });
  }
}
