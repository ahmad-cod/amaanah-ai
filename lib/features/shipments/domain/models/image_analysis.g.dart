// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_analysis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageAnalysisImpl _$$ImageAnalysisImplFromJson(Map<String, dynamic> json) =>
    _$ImageAnalysisImpl(
      imagePath: json['imagePath'] as String,
      detectedObject: json['detectedObject'] as String,
      extractedText: json['extractedText'] as String?,
      qualityScore: (json['qualityScore'] as num).toDouble(),
    );

Map<String, dynamic> _$$ImageAnalysisImplToJson(_$ImageAnalysisImpl instance) =>
    <String, dynamic>{
      'imagePath': instance.imagePath,
      'detectedObject': instance.detectedObject,
      'extractedText': instance.extractedText,
      'qualityScore': instance.qualityScore,
    };
