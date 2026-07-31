import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/inventory_item.dart';
import '../../domain/repositories/inventory_repository.dart';
import '../datasources/inventory_local_datasource.dart';
import '../mappers/inventory_mapper.dart';

class InventoryRepositoryImpl implements InventoryRepository {
  final InventoryLocalDatasource localDatasource;

  InventoryRepositoryImpl({required this.localDatasource});

  @override
  Future<Result<List<InventoryItem>>> getInventoryItems() async {
    try {
      final schemas = await localDatasource.getInventoryItems();
      final items = schemas.map((s) => s.toDomain()).toList();
      return Success(items);
    } on DatabaseException catch (e) {
      return FailureResult(DatabaseFailure(e.message));
    } catch (e) {
      return FailureResult(DatabaseFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Result<InventoryItem>> updateStock(String id, int delta) async {
    try {
      final existingSchema = await localDatasource.getItemById(id);
      if (existingSchema == null) {
        return const FailureResult(NotFoundFailure('Inventory item not found'));
      }

      final domain = existingSchema.toDomain();
      final newQuantity = (domain.quantity + delta).clamp(0, 999999);
      final updatedDomain = domain.copyWith(
        quantity: newQuantity,
        lastUpdated: DateTime.now(),
      );

      final updatedSchema = updatedDomain.toSchema()..isarId = existingSchema.isarId;
      final saved = await localDatasource.saveItem(updatedSchema);
      return Success(saved.toDomain());
    } on DatabaseException catch (e) {
      return FailureResult(DatabaseFailure(e.message));
    } catch (e) {
      return FailureResult(DatabaseFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Result<InventoryItem>> addInventoryItem(InventoryItem item) async {
    try {
      final schema = item.toSchema();
      final saved = await localDatasource.saveItem(schema);
      return Success(saved.toDomain());
    } on DatabaseException catch (e) {
      return FailureResult(DatabaseFailure(e.message));
    } catch (e) {
      return FailureResult(DatabaseFailure('Unexpected error: $e'));
    }
  }
}
