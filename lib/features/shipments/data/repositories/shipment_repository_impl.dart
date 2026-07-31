import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/shipment.dart';
import '../../domain/repositories/shipment_repository.dart';
import '../datasources/shipment_local_datasource.dart';
import '../mappers/shipment_mapper.dart';

class ShipmentRepositoryImpl implements ShipmentRepository {
  final ShipmentLocalDatasource localDatasource;

  ShipmentRepositoryImpl({required this.localDatasource});

  @override
  Future<Result<List<Shipment>>> getShipments() async {
    try {
      final schemas = await localDatasource.getShipments();
      final entities = schemas.map((s) => s.toDomain()).toList();
      return Success(entities);
    } on DatabaseException catch (e) {
      return FailureResult(DatabaseFailure(e.message));
    } catch (e) {
      return FailureResult(DatabaseFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Result<Shipment>> getShipmentById(String id) async {
    try {
      final schema = await localDatasource.getShipmentById(id);
      if (schema == null) {
        return const FailureResult(NotFoundFailure('Shipment not found'));
      }
      return Success(schema.toDomain());
    } on DatabaseException catch (e) {
      return FailureResult(DatabaseFailure(e.message));
    } catch (e) {
      return FailureResult(DatabaseFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Result<Shipment>> createShipment(Shipment shipment) async {
    try {
      final schema = shipment.toSchema();
      final saved = await localDatasource.saveShipment(schema);
      return Success(saved.toDomain());
    } on DatabaseException catch (e) {
      return FailureResult(DatabaseFailure(e.message));
    } catch (e) {
      return FailureResult(DatabaseFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Result<Shipment>> updateShipmentStatus(String id, ShipmentStatus newStatus) async {
    try {
      final existingSchema = await localDatasource.getShipmentById(id);
      if (existingSchema == null) {
        return const FailureResult(NotFoundFailure('Shipment not found'));
      }
      final domain = existingSchema.toDomain().copyWith(status: newStatus);
      final updatedSchema = domain.toSchema()..isarId = existingSchema.isarId;
      final saved = await localDatasource.saveShipment(updatedSchema);
      return Success(saved.toDomain());
    } on DatabaseException catch (e) {
      return FailureResult(DatabaseFailure(e.message));
    } catch (e) {
      return FailureResult(DatabaseFailure('Unexpected error: $e'));
    }
  }
}
