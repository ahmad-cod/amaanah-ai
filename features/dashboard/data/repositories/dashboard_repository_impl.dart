import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/dashboard_stats.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_local_datasource.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardLocalDatasource localDatasource;

  DashboardRepositoryImpl({required this.localDatasource});

  @override
  Future<Result<DashboardStats>> getDashboardStats() async {
    try {
      final model = await localDatasource.getStats();
      return Success(model.toEntity());
    } on DatabaseException catch (e) {
      return FailureResult(DatabaseFailure(e.message));
    } catch (e) {
      return FailureResult(DatabaseFailure('Unexpected error: $e'));
    }
  }
}
