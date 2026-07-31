import '../../../../core/utils/result.dart';
import '../entities/dashboard_stats.dart';

abstract class DashboardRepository {
  Future<Result<DashboardStats>> getDashboardStats();
}
