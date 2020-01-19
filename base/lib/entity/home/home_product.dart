import 'package:base/entity/price/price_category.dart';
import 'package:json_annotation/json_annotation.dart';
part 'home_product.g.dart';

@JsonSerializable()
class HomeProduct {
  String createdAt;
  String updatedAt;
  String name;
  String imageUrl;
  int subscribeCount;
  bool subscribed;
  bool liked;
  bool disliked;
  int raffleCount;
  String objectId;
  List<String> avatarUrls;
  HomeBrandBean brand;
  int dislikeCount;
  int likeCount;
  String sku;
  List<String> extraImageUrls;
  String price;
  int commentCount;
  String headerName;

  HomeProduct({this.createdAt, this.updatedAt, this.name, this.imageUrl,
    this.subscribeCount, this.subscribed, this.liked, this.disliked,
    this.raffleCount, this.objectId, this.avatarUrls, this.brand,
    this.dislikeCount, this.likeCount, this.sku, this.extraImageUrls,
    this.price, this.commentCount, this.headerName});
  
  factory HomeProduct.fromJson(Map<String, dynamic> json) => _$HomeProductFromJson(json);

  Map<String, dynamic> toJson() => _$HomeProductToJson(this);
  

}

@JsonSerializable()
class HomeBrandBean{
   String imageUrl;
   String name;
   String objectId;
   List<PriceCategoryBean> categories;
   String type;

   HomeBrandBean({this.imageUrl, this.name, this.objectId, this.categories,
     this.type});

   factory HomeBrandBean.fromJson(Map<String, dynamic> json) => _$HomeBrandBeanFromJson(json);

   Map<String, dynamic> toJson() => _$HomeBrandBeanToJson(this);
}

