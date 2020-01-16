import 'package:json_annotation/json_annotation.dart';
part 'home_data.g.dart';

@JsonSerializable()
class HomeData {
  List<HomeCategoryBean> categories;
  HomeItem items;
  HomeFabBean fab;
  List<CircleDynamicBean> posts;

  HomeData({this.categories, this.items, this.fab, this.posts});

  factory HomeData.fromJson(Map<String, dynamic> json) => _$HomeDataFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataToJson(this);

}

@JsonSerializable()
class HomeBadgeBean {
  String title;
  String bgImageUrl;
  String startColor = "#C47BFF";
  String endColor = "#FF8FF1";

  HomeBadgeBean({this.title, this.bgImageUrl, this.startColor, this.endColor});

  factory HomeBadgeBean.fromJson(Map<String, dynamic> json) => _$HomeBadgeBeanFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBadgeBeanToJson(this);

}

@JsonSerializable()
class HomeBanner {
  String imageUrl;
  String targetUrl;

  HomeBanner({this.imageUrl, this.targetUrl});

  factory HomeBanner.fromJson(Map<String, dynamic> json) => _$HomeBannerFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBannerToJson(this);

}

@JsonSerializable()
class HomeCategoryBean {
  String name;
  String type;
  String objectId;
  String link;

  HomeCategoryBean({this.name, this.type, this.objectId, this.link});

  factory HomeCategoryBean.fromJson(Map<String, dynamic> json) => _$HomeCategoryBeanFromJson(json);

  Map<String, dynamic> toJson() => _$HomeCategoryBeanToJson(this);
}

@JsonSerializable()
class CircleDynamicBean {
  String imageUrl;
  String link;
  int width;
  int height;

  CircleDynamicBean({this.imageUrl, this.link, this.width, this.height});

  factory CircleDynamicBean.fromJson(Map<String, dynamic> json) => _$CircleDynamicBeanFromJson(json);

  Map<String, dynamic> toJson() => _$CircleDynamicBeanToJson(this);
}

@JsonSerializable()
class HomeFabBean {
  String imageUrl;
  String link;
  int width;
  int height;
  HomeFabBean({this.imageUrl, this.link, this.width, this.height});

  factory HomeFabBean.fromJson(Map<String, dynamic> json) => _$HomeFabBeanFromJson(json);

  Map<String, dynamic> toJson() => _$HomeFabBeanToJson(this);
}

@JsonSerializable()
class HomeHeadCommonBean {
  String link;
  String title;
  String imageUrl;
  HomeBadgeBean badge;

  HomeHeadCommonBean({this.link, this.title, this.imageUrl, this.badge});

  factory HomeHeadCommonBean.fromJson(Map<String, dynamic> json) => _$HomeHeadCommonBeanFromJson(json);

  Map<String, dynamic> toJson() => _$HomeHeadCommonBeanToJson(this);

}


@JsonSerializable()
class HomeItem {
  List<HomeBanner> bannerItems;
  List<HomeHeadCommonBean> pagerItems;
  List<HomeHeadCommonBean> plainItems;
  List<HomeHeadCommonBean> cardItems;

  HomeItem({this.bannerItems, this.pagerItems, this.plainItems, this.cardItems});

  factory HomeItem.fromJson(Map<String, dynamic> json) => _$HomeItemFromJson(json);

  Map<String, dynamic> toJson() => _$HomeItemToJson(this);

}