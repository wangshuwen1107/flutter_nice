// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceCategoryBean _$PriceCategoryBeanFromJson(Map<String, dynamic> json) {
  return PriceCategoryBean(
    name: json['name'] as String,
    imageUrl: json['imageUrl'] as String,
    objectId: json['objectId'] as String,
  );
}

Map<String, dynamic> _$PriceCategoryBeanToJson(PriceCategoryBean instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'objectId': instance.objectId,
    };
