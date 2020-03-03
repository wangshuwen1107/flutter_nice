
import 'package:json_annotation/json_annotation.dart';

part 'mine_item_bean.g.dart';
@JsonSerializable()
class MineItemBean {
  String name;
  String iconRes;
  String type;

  MineItemBean({this.name, this.iconRes, this.type});

  factory MineItemBean.fromJson(Map<String, dynamic> json) => _$MineItemBeanFromJson(json);

  Map<String, dynamic> toJson() => _$MineItemBeanToJson(this);

}