import 'package:freezed_annotation/freezed_annotation.dart';

part 'risk_assessment.freezed.dart';
part 'risk_assessment.g.dart';

@freezed
class RiskAssessment with _$RiskAssessment {
  const factory RiskAssessment({
    required String riskLevel,
    required List<String> riskFactors,
    required String mitigationStrategy,
  }) = _RiskAssessment;

  factory RiskAssessment.fromJson(Map<String, dynamic> json) =>
      _$RiskAssessmentFromJson(json);
}
