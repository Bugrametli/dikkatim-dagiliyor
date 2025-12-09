// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppEntityImpl _$$AppEntityImplFromJson(Map<String, dynamic> json) =>
    _$AppEntityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      iconUrl: json['iconUrl'] as String,
      dangerLevel: (json['dangerLevel'] as num?)?.toInt() ?? 0,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$AppEntityImplToJson(_$AppEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconUrl': instance.iconUrl,
      'dangerLevel': instance.dangerLevel,
      'category': instance.category,
    };
