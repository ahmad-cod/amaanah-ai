// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'risk_assessment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RiskAssessmentImpl _$$RiskAssessmentImplFromJson(
        Map<String, dynamic> json) =>
    _$RiskAssessmentImpl(
      riskLevel: json['riskLevel'] as String,
      riskFactors: (json['riskFactors'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      mitigationStrategy: json['mitigationStrategy'] as String,
    );

Map<String, dynamic> _$$RiskAssessmentImplToJson(
        _$RiskAssessmentImpl instance) =>
    <String, dynamic>{
      'riskLevel': instance.riskLevel,
      'riskFactors': instance.riskFactors,
      'mitigationStrategy': instance.mitigationStrategy,
    };
