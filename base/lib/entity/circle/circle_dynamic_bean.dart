import 'package:base/entity/home/home_product.dart';
import 'package:json_annotation/json_annotation.dart';
part 'circle_dynamic_bean.g.dart';

@JsonSerializable()
class CircleDynamicBean {
  int favorCount;
  bool favored;
  CircleTopicBean topic;
  String content;
  int commentCount;
  CircleUserBean user;
  int createdAt;
  String objectId;
  List<CircleImageBean> images;
  CircleLinkBean webpageLink;
  HomeProduct product;
  CircleVideoBean video;
  CircleBadge badge;
  CircleOverlayBean overlay;

  CircleDynamicBean({this.favorCount, this.favored, this.topic, this.content,
  this.commentCount, this.user, this.createdAt, this.objectId, this.images,
  this.webpageLink, this.product, this.video, this.badge, this.overlay});

  factory CircleDynamicBean.fromJson(Map<String, dynamic> json) => _$CircleDynamicBeanFromJson(json);

  Map<String, dynamic> toJson() => _$CircleDynamicBeanToJson(this);
  

}

@JsonSerializable()
class CircleImageBean {
  int height;
  int width;
  String thumbnail;
  String format;
  String url;

  CircleImageBean({this.width, this.thumbnail, this.format, this.url});

  factory CircleImageBean.fromJson(Map<String, dynamic> json) => _$CircleImageBeanFromJson(json);

  Map<String, dynamic> toJson() => _$CircleImageBeanToJson(this);

}

@JsonSerializable()
class CircleTopicBean {
  String desc;
  String name;
  int index;
  String imageUrl;
  String staticImageUrl;
  String intro;
  String objectId;
  String updatedAt;
  String createdAt;
  List<String> placeholders;
  bool subscribed;
  String composeType;

  CircleTopicBean({this.desc, this.name, this.index, this.imageUrl,
    this.staticImageUrl, this.intro, this.objectId, this.updatedAt,
    this.createdAt, this.placeholders, this.subscribed, this.composeType});


  factory CircleTopicBean.fromJson(Map<String, dynamic> json) => _$CircleTopicBeanFromJson(json);

  Map<String, dynamic> toJson() => _$CircleTopicBeanToJson(this);
  
}

@JsonSerializable()
class CircleUserBean {
  String avatarUrl;
  String nickName;
  String objectId;

  CircleUserBean({this.avatarUrl, this.nickName, this.objectId});

  factory CircleUserBean.fromJson(Map<String, dynamic> json) => _$CircleUserBeanFromJson(json);

  Map<String, dynamic> toJson() => _$CircleUserBeanToJson(this);
  
}

@JsonSerializable()
class CircleLinkBean {
  String link;
  String title;

  CircleLinkBean({this.link, this.title});

  factory CircleLinkBean.fromJson(Map<String, dynamic> json) => _$CircleLinkBeanFromJson(json);

  Map<String, dynamic> toJson() => _$CircleLinkBeanToJson(this);
}

@JsonSerializable()
class CircleVideoBean {
  String url;
  int width;
  int height;

  CircleVideoBean({this.url, this.width, this.height});

  factory CircleVideoBean.fromJson(Map<String, dynamic> json) => _$CircleVideoBeanFromJson(json);

  Map<String, dynamic> toJson() => _$CircleVideoBeanToJson(this);

}

@JsonSerializable()
class CircleBadge {
  String color;
  String text;

  CircleBadge({this.color, this.text});

  factory CircleBadge.fromJson(Map<String, dynamic> json) => _$CircleBadgeFromJson(json);

  Map<String, dynamic> toJson() => _$CircleBadgeToJson(this);

}

@JsonSerializable()
class CircleOverlayBean {
  int marginRight;
  String imageUrl;
  int width;
  int marginTop;
  int height;

  CircleOverlayBean({this.marginRight, this.imageUrl, this.width, this.marginTop,
    this.height});

  factory CircleOverlayBean.fromJson(Map<String, dynamic> json) => _$CircleOverlayBeanFromJson(json);

  Map<String, dynamic> toJson() => _$CircleOverlayBeanToJson(this);


}
