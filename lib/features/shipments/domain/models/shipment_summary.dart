import 'package:freezed_annotation/freezed_annotation.dart';
import 'shipment.dart';
import 'conversation_analysis.dart';
import 'image_analysis.dart';
import 'risk_assessment.dart';
import 'recommendation.dart';

part 'shipment_summary.freezed.dart';
part 'shipment_summary.g.dart';

@freezed
class ShipmentSummary with _$ShipmentSummary {
  const factory ShipmentSummary({
    required Shipment shipment,
    ConversationAnalysis? conversationAnalysis,
    ImageAnalysis? imageAnalysis,
    required RiskAssessment riskAssessment,
    required Recommendation recommendation,
    required double overallConfidence,
  }) = _ShipmentSummary;

  factory ShipmentSummary.fromJson(Map<String, dynamic> json) =>
      _$ShipmentSummaryFromJson(json);
}
