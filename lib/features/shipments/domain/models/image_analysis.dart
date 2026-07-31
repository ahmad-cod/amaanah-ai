import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_analysis.freezed.dart';
part 'image_analysis.g.dart';

@freezed
class ImageAnalysis with _$ImageAnalysis {
  const factory ImageAnalysis({
    required String imagePath,
    required String detectedObject,
    String? extractedText,
    required double qualityScore,
  }) = _ImageAnalysis;

  factory ImageAnalysis.fromJson(Map<String, dynamic> json) =>
      _$ImageAnalysisFromJson(json);
}
