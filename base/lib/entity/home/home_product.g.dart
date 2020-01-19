// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeProduct _$HomeProductFromJson(Map<String, dynamic> json) {
  return HomeProduct(
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
    name: json['name'] as String,
    imageUrl: json['imageUrl'] as String,
    subscribeCount: json['subscribeCount'] as int,
    subscribed: json['subscribed'] as bool,
    liked: json['liked'] as bool,
    disliked: json['disliked'] as bool,
    raffleCount: json['raffleCount'] as int,
    objectId: json['objectId'] as String,
    avatarUrls: (json['avatarUrls'] as List)?.map((e) => e as String)?.toList(),
    brand: json['brand'] == null
        ? null
        : HomeBrandBean.fromJson(json['brand'] as Map<String, dynamic>),
    dislikeCount: json['dislikeCount'] as int,
    likeCount: json['likeCount'] as int,
    sku: json['sku'] as String,
    extraImageUrls:
        (json['extraImageUrls'] as List)?.map((e) => e as String)?.toList(),
    price: json['price'] as String,
    commentCount: json['commentCount'] as int,
    headerName: json['headerName'] as String,
  );
}

Map<String, dynamic> _$HomeProductToJson(HomeProduct instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'subscribeCount': instance.subscribeCount,
      'subscribed': instance.subscribed,
      'liked': instance.liked,
      'disliked': instance.disliked,
      'raffleCount': instance.raffleCount,
      'objectId': instance.objectId,
      'avatarUrls': instance.avatarUrls,
      'brand': instance.brand,
      'dislikeCount': instance.dislikeCount,
      'likeCount': instance.likeCount,
      'sku': instance.sku,
      'extraImageUrls': instance.extraImageUrls,
      'price': instance.price,
      'commentCount': instance.commentCount,
      'headerName': instance.headerName,
    };

HomeBrandBean _$HomeBrandBeanFromJson(Map<String, dynamic> json) {
  return HomeBrandBean(
    imageUrl: json['imageUrl'] as String,
    name: json['name'] as String,
    objectId: json['objectId'] as String,
    categories: (json['categories'] as List)
        ?.map((e) => e == null
            ? null
            : PriceCategoryBean.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$HomeBrandBeanToJson(HomeBrandBean instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'objectId': instance.objectId,
      'categories': instance.categories,
      'type': instance.type,
    };
