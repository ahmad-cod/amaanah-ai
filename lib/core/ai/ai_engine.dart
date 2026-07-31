import '../../features/shipments/domain/models/conversation_analysis.dart';
import '../../features/shipments/domain/models/image_analysis.dart';
import '../../features/shipments/domain/models/recommendation.dart';
import '../../features/shipments/domain/models/risk_assessment.dart';
import '../../features/shipments/domain/models/shipment.dart';
import '../../features/shipments/domain/models/shipment_summary.dart';

/// Abstract AI Engine interface for on-device logistics intelligence.
/// Defines contracts for conversation parsing, image OCR/detection,
/// cross-modal comparison, shipment summarization, and risk assessment.
abstract class AIEngine {
  /// Extracts structured logistics entities and intent from conversation text.
  Future<ConversationAnalysis> extractConversation(String conversationText);

  /// Analyzes an image file (cargo, waybill, label) for text and object classification.
  Future<ImageAnalysis> analyzeImage(String imagePath);

  /// Compares information extracted from text vs visual cargo evidence for consistency.
  Future<bool> compare(
    ConversationAnalysis conversation,
    ImageAnalysis image,
  );

  /// Aggregates conversation and image inputs into a unified shipment summary.
  Future<ShipmentSummary> summarize({
    required ConversationAnalysis conversation,
    required ImageAnalysis image,
  });

  /// Assesses potential logistical risks for a shipment and cargo image.
  Future<RiskAssessment> assessRisk({
    required Shipment shipment,
    required ImageAnalysis image,
  });
}
