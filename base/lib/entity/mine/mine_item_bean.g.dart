// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mine_item_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MineItemBean _$MineItemBeanFromJson(Map<String, dynamic> json) {
  return MineItemBean(
    name: json['name'] as String,
    iconRes: json['iconRes'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$MineItemBeanToJson(MineItemBean instance) =>
    <String, dynamic>{
      'name': instance.name,
      'iconRes': instance.iconRes,
      'type': instance.type,
    };
