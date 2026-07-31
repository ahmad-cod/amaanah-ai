import 'package:isar/isar.dart';
import '../../../../core/errors/exceptions.dart';
import 'db/schemas/shipment_schema.dart';

abstract class ShipmentLocalDatasource {
  Future<List<ShipmentSchema>> getShipments();
  Future<ShipmentSchema?> getShipmentById(String id);
  Future<ShipmentSchema> saveShipment(ShipmentSchema shipment);
  Future<bool> deleteShipment(String id);
}

class ShipmentLocalDatasourceImpl implements ShipmentLocalDatasource {
  final Isar isar;

  ShipmentLocalDatasourceImpl(this.isar);

  @override
  Future<List<ShipmentSchema>> getShipments() async {
    try {
      return await isar.shipmentSchemas.where().findAll();
    } catch (e) {
      throw DatabaseException('Failed to fetch shipments: $e');
    }
  }

  @override
  Future<ShipmentSchema?> getShipmentById(String id) async {
    try {
      return await isar.shipmentSchemas.filter().uuidEqualTo(id).findFirst();
    } catch (e) {
      throw DatabaseException('Failed to fetch shipment by id: $e');
    }
  }

  @override
  Future<ShipmentSchema> saveShipment(ShipmentSchema shipment) async {
    try {
      await isar.writeTxn(() async {
        await isar.shipmentSchemas.put(shipment);
      });
      return shipment;
    } catch (e) {
      throw DatabaseException('Failed to save shipment: $e');
    }
  }

  @override
  Future<bool> deleteShipment(String id) async {
    try {
      final existing = await isar.shipmentSchemas.filter().uuidEqualTo(id).findFirst();
      if (existing != null) {
        await isar.writeTxn(() async {
          await isar.shipmentSchemas.delete(existing.isarId);
        });
        return true;
      }
      return false;
    } catch (e) {
      throw DatabaseException('Failed to delete shipment: $e');
    }
  }
}
