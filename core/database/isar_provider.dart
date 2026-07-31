import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

/// Provider for the initialized Isar database instance.
/// Overridden in main.dart inside ProviderScope after async initialization.
final isarProvider = Provider<Isar>((ref) {
  throw UnimplementedError('isarProvider must be overridden in ProviderScope');
});
