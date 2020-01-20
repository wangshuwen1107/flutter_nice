// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circle_dynamic_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CircleDynamicBean _$CircleDynamicBeanFromJson(Map<String, dynamic> json) {
  return CircleDynamicBean(
    favorCount: json['favorCount'] as int,
    favored: json['favored'] as bool,
    topic: json['topic'] == null
        ? null
        : CircleTopicBean.fromJson(json['topic'] as Map<String, dynamic>),
    content: json['content'] as String,
    commentCount: json['commentCount'] as int,
    user: json['user'] == null
        ? null
        : CircleUserBean.fromJson(json['user'] as Map<String, dynamic>),
    createdAt: json['createdAt'] as int,
    objectId: json['objectId'] as String,
    images: (json['images'] as List)
        ?.map((e) => e == null
            ? null
            : CircleImageBean.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    webpageLink: json['webpageLink'] == null
        ? null
        : CircleLinkBean.fromJson(json['webpageLink'] as Map<String, dynamic>),
    product: json['product'] == null
        ? null
        : HomeProduct.fromJson(json['product'] as Map<String, dynamic>),
    video: json['video'] == null
        ? null
        : CircleVideoBean.fromJson(json['video'] as Map<String, dynamic>),
    badge: json['badge'] == null
        ? null
        : CircleBadge.fromJson(json['badge'] as Map<String, dynamic>),
    overlay: json['overlay'] == null
        ? null
        : CircleOverlayBean.fromJson(json['overlay'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CircleDynamicBeanToJson(CircleDynamicBean instance) =>
    <String, dynamic>{
      'favorCount': instance.favorCount,
      'favored': instance.favored,
      'topic': instance.topic,
      'content': instance.content,
      'commentCount': instance.commentCount,
      'user': instance.user,
      'createdAt': instance.createdAt,
      'objectId': instance.objectId,
      'images': instance.images,
      'webpageLink': instance.webpageLink,
      'product': instance.product,
      'video': instance.video,
      'badge': instance.badge,
      'overlay': instance.overlay,
    };

CircleImageBean _$CircleImageBeanFromJson(Map<String, dynamic> json) {
  return CircleImageBean(
    width: json['width'] as int,
    thumbnail: json['thumbnail'] as String,
    format: json['format'] as String,
    url: json['url'] as String,
  )..height = json['height'] as int;
}

Map<String, dynamic> _$CircleImageBeanToJson(CircleImageBean instance) =>
    <String, dynamic>{
      'height': instance.height,
      'width': instance.width,
      'thumbnail': instance.thumbnail,
      'format': instance.format,
      'url': instance.url,
    };

CircleTopicBean _$CircleTopicBeanFromJson(Map<String, dynamic> json) {
  return CircleTopicBean(
    desc: json['desc'] as String,
    name: json['name'] as String,
    index: json['index'] as int,
    imageUrl: json['imageUrl'] as String,
    staticImageUrl: json['staticImageUrl'] as String,
    intro: json['intro'] as String,
    objectId: json['objectId'] as String,
    updatedAt: json['updatedAt'] as String,
    createdAt: json['createdAt'] as String,
    placeholders:
        (json['placeholders'] as List)?.map((e) => e as String)?.toList(),
    subscribed: json['subscribed'] as bool,
    composeType: json['composeType'] as String,
  );
}

Map<String, dynamic> _$CircleTopicBeanToJson(CircleTopicBean instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'name': instance.name,
      'index': instance.index,
      'imageUrl': instance.imageUrl,
      'staticImageUrl': instance.staticImageUrl,
      'intro': instance.intro,
      'objectId': instance.objectId,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
      'placeholders': instance.placeholders,
      'subscribed': instance.subscribed,
      'composeType': instance.composeType,
    };

CircleUserBean _$CircleUserBeanFromJson(Map<String, dynamic> json) {
  return CircleUserBean(
    avatarUrl: json['avatarUrl'] as String,
    nickName: json['nickName'] as String,
    objectId: json['objectId'] as String,
  );
}

Map<String, dynamic> _$CircleUserBeanToJson(CircleUserBean instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl,
      'nickName': instance.nickName,
      'objectId': instance.objectId,
    };

CircleLinkBean _$CircleLinkBeanFromJson(Map<String, dynamic> json) {
  return CircleLinkBean(
    link: json['link'] as String,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$CircleLinkBeanToJson(CircleLinkBean instance) =>
    <String, dynamic>{
      'link': instance.link,
      'title': instance.title,
    };

CircleVideoBean _$CircleVideoBeanFromJson(Map<String, dynamic> json) {
  return CircleVideoBean(
    url: json['url'] as String,
    width: (json['width'] as num)?.toDouble(),
    height: (json['height'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CircleVideoBeanToJson(CircleVideoBean instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };

CircleBadge _$CircleBadgeFromJson(Map<String, dynamic> json) {
  return CircleBadge(
    color: json['color'] as String,
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$CircleBadgeToJson(CircleBadge instance) =>
    <String, dynamic>{
      'color': instance.color,
      'text': instance.text,
    };

CircleOverlayBean _$CircleOverlayBeanFromJson(Map<String, dynamic> json) {
  return CircleOverlayBean(
    marginRight: json['marginRight'] as int,
    imageUrl: json['imageUrl'] as String,
    width: json['width'] as int,
    marginTop: json['marginTop'] as int,
    height: json['height'] as int,
  );
}

Map<String, dynamic> _$CircleOverlayBeanToJson(CircleOverlayBean instance) =>
    <String, dynamic>{
      'marginRight': instance.marginRight,
      'imageUrl': instance.imageUrl,
      'width': instance.width,
      'marginTop': instance.marginTop,
      'height': instance.height,
    };
