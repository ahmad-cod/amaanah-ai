import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'ai_engine.dart';

/// Riverpod provider for the abstract AIEngine contract.
/// Concrete implementations (e.g. GemmaAIEngine or MockAIEngine) override this provider.
final aiEngineProvider = Provider<AIEngine>((ref) {
  throw UnimplementedError('aiEngineProvider must be implemented or overridden');
});
