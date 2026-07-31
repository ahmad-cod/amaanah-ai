// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShipmentSummaryImpl _$$ShipmentSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$ShipmentSummaryImpl(
      shipment: Shipment.fromJson(json['shipment'] as Map<String, dynamic>),
      conversationAnalysis: json['conversationAnalysis'] == null
          ? null
          : ConversationAnalysis.fromJson(
              json['conversationAnalysis'] as Map<String, dynamic>),
      imageAnalysis: json['imageAnalysis'] == null
          ? null
          : ImageAnalysis.fromJson(
              json['imageAnalysis'] as Map<String, dynamic>),
      riskAssessment: RiskAssessment.fromJson(
          json['riskAssessment'] as Map<String, dynamic>),
      recommendation: Recommendation.fromJson(
          json['recommendation'] as Map<String, dynamic>),
      overallConfidence: (json['overallConfidence'] as num).toDouble(),
    );

Map<String, dynamic> _$$ShipmentSummaryImplToJson(
        _$ShipmentSummaryImpl instance) =>
    <String, dynamic>{
      'shipment': instance.shipment,
      'conversationAnalysis': instance.conversationAnalysis,
      'imageAnalysis': instance.imageAnalysis,
      'riskAssessment': instance.riskAssessment,
      'recommendation': instance.recommendation,
      'overallConfidence': instance.overallConfidence,
    };
