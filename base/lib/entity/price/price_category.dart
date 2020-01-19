import 'package:json_annotation/json_annotation.dart';
part 'price_category.g.dart';

@JsonSerializable()
class PriceCategoryBean{
  String name;
  String imageUrl;
  String objectId;

  PriceCategoryBean({this.name, this.imageUrl, this.objectId});

  factory PriceCategoryBean.fromJson(Map<String, dynamic> json) => _$PriceCategoryBeanFromJson(json);

  Map<String, dynamic> toJson() => _$PriceCategoryBeanToJson(this);
}