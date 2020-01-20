// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeData _$HomeDataFromJson(Map<String, dynamic> json) {
  return HomeData(
    categories: (json['categories'] as List)
        ?.map((e) => e == null
            ? null
            : HomeCategoryBean.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    items: json['items'] == null
        ? null
        : HomeItem.fromJson(json['items'] as Map<String, dynamic>),
    fab: json['fab'] == null
        ? null
        : HomeFabBean.fromJson(json['fab'] as Map<String, dynamic>),
    posts: (json['posts'] as List)
        ?.map((e) => e == null
            ? null
            : CircleDynamicBean.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HomeDataToJson(HomeData instance) => <String, dynamic>{
      'categories': instance.categories,
      'items': instance.items,
      'fab': instance.fab,
      'posts': instance.posts,
    };

HomeBadgeBean _$HomeBadgeBeanFromJson(Map<String, dynamic> json) {
  return HomeBadgeBean(
    title: json['title'] as String,
    bgImageUrl: json['bgImageUrl'] as String,
    startColor: json['startColor'] as String,
    endColor: json['endColor'] as String,
  );
}

Map<String, dynamic> _$HomeBadgeBeanToJson(HomeBadgeBean instance) =>
    <String, dynamic>{
      'title': instance.title,
      'bgImageUrl': instance.bgImageUrl,
      'startColor': instance.startColor,
      'endColor': instance.endColor,
    };

HomeBanner _$HomeBannerFromJson(Map<String, dynamic> json) {
  return HomeBanner(
    imageUrl: json['imageUrl'] as String,
    targetUrl: json['targetUrl'] as String,
  );
}

Map<String, dynamic> _$HomeBannerToJson(HomeBanner instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'targetUrl': instance.targetUrl,
    };

HomeCategoryBean _$HomeCategoryBeanFromJson(Map<String, dynamic> json) {
  return HomeCategoryBean(
    name: json['name'] as String,
    type: json['type'] as String,
    objectId: json['objectId'] as String,
    link: json['link'] as String,
  );
}

Map<String, dynamic> _$HomeCategoryBeanToJson(HomeCategoryBean instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'objectId': instance.objectId,
      'link': instance.link,
    };

HomeFabBean _$HomeFabBeanFromJson(Map<String, dynamic> json) {
  return HomeFabBean(
    imageUrl: json['imageUrl'] as String,
    link: json['link'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
  );
}

Map<String, dynamic> _$HomeFabBeanToJson(HomeFabBean instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'link': instance.link,
      'width': instance.width,
      'height': instance.height,
    };

HomeHeadCommonBean _$HomeHeadCommonBeanFromJson(Map<String, dynamic> json) {
  return HomeHeadCommonBean(
    link: json['link'] as String,
    title: json['title'] as String,
    imageUrl: json['imageUrl'] as String,
    badge: json['badge'] == null
        ? null
        : HomeBadgeBean.fromJson(json['badge'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HomeHeadCommonBeanToJson(HomeHeadCommonBean instance) =>
    <String, dynamic>{
      'link': instance.link,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'badge': instance.badge,
    };

HomeItem _$HomeItemFromJson(Map<String, dynamic> json) {
  return HomeItem(
    bannerItems: (json['bannerItems'] as List)
        ?.map((e) =>
            e == null ? null : HomeBanner.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pagerItems: (json['pagerItems'] as List)
        ?.map((e) => e == null
            ? null
            : HomeHeadCommonBean.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    plainItems: (json['plainItems'] as List)
        ?.map((e) => e == null
            ? null
            : HomeHeadCommonBean.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    cardItems: (json['cardItems'] as List)
        ?.map((e) => e == null
            ? null
            : HomeHeadCommonBean.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HomeItemToJson(HomeItem instance) => <String, dynamic>{
      'bannerItems': instance.bannerItems,
      'pagerItems': instance.pagerItems,
      'plainItems': instance.plainItems,
      'cardItems': instance.cardItems,
    };
