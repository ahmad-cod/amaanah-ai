// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_analysis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationAnalysisImpl _$$ConversationAnalysisImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversationAnalysisImpl(
      rawText: json['rawText'] as String,
      intent: json['intent'] as String,
      extractedEntities: (json['extractedEntities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      confidence: (json['confidence'] as num).toDouble(),
    );

Map<String, dynamic> _$$ConversationAnalysisImplToJson(
        _$ConversationAnalysisImpl instance) =>
    <String, dynamic>{
      'rawText': instance.rawText,
      'intent': instance.intent,
      'extractedEntities': instance.extractedEntities,
      'confidence': instance.confidence,
    };
