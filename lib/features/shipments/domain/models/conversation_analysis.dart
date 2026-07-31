import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_analysis.freezed.dart';
part 'conversation_analysis.g.dart';

@freezed
class ConversationAnalysis with _$ConversationAnalysis {
  const factory ConversationAnalysis({
    required String rawText,
    required String intent,
    required List<String> extractedEntities,
    required double confidence,
  }) = _ConversationAnalysis;

  factory ConversationAnalysis.fromJson(Map<String, dynamic> json) =>
      _$ConversationAnalysisFromJson(json);
}
