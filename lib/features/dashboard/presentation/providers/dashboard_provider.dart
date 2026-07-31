import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/isar_provider.dart';
import '../../data/datasources/dashboard_local_datasource.dart';
import '../../data/repositories/dashboard_repository_impl.dart';
import '../../domain/entities/dashboard_stats.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../../domain/usecases/get_dashboard_stats.dart';

final dashboardLocalDatasourceProvider = Provider<DashboardLocalDatasource>((ref) {
  final isar = ref.watch(isarProvider);
  return DashboardLocalDatasourceImpl(isar);
});

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  final localDatasource = ref.watch(dashboardLocalDatasourceProvider);
  return DashboardRepositoryImpl(localDatasource: localDatasource);
});

final getDashboardStatsUseCaseProvider = Provider<GetDashboardStats>((ref) {
  final repository = ref.watch(dashboardRepositoryProvider);
  return GetDashboardStats(repository);
});

class DashboardNotifier extends AsyncNotifier<DashboardStats> {
  @override
  Future<DashboardStats> build() async {
    return _fetchStats();
  }

  Future<DashboardStats> _fetchStats() async {
    final useCase = ref.read(getDashboardStatsUseCaseProvider);
    final result = await useCase.execute();
    return result.fold(
      onSuccess: (stats) => stats,
      onFailure: (failure) => throw Exception(failure.message),
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchStats());
  }
}

final dashboardProvider = AsyncNotifierProvider<DashboardNotifier, DashboardStats>(
  DashboardNotifier.new,
);
