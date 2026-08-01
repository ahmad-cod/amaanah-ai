import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'ai_engine.dart';
import 'gemma_engine.dart';

/// Riverpod provider for the on-device Gemma AI Engine.
final aiEngineProvider = Provider<AIEngine>((ref) {
  return GemmaEngine();
});
