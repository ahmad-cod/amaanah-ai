import '../../../../core/utils/result.dart';
import '../entities/dashboard_stats.dart';
import '../repositories/dashboard_repository.dart';

class GetDashboardStats {
  final DashboardRepository repository;

  const GetDashboardStats(this.repository);

  Future<Result<DashboardStats>> execute() {
    return repository.getDashboardStats();
  }
}
