// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecommendationImpl _$$RecommendationImplFromJson(
        Map<String, dynamic> json) =>
    _$RecommendationImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      priority: json['priority'] as String,
      suggestedAction: json['suggestedAction'] as String,
    );

Map<String, dynamic> _$$RecommendationImplToJson(
        _$RecommendationImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'priority': instance.priority,
      'suggestedAction': instance.suggestedAction,
    };
