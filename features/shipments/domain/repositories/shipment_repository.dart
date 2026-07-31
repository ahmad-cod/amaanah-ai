import '../../../../core/utils/result.dart';
import '../entities/shipment.dart';

abstract class ShipmentRepository {
  Future<Result<List<Shipment>>> getShipments();
  Future<Result<Shipment>> getShipmentById(String id);
  Future<Result<Shipment>> createShipment(Shipment shipment);
  Future<Result<Shipment>> updateShipmentStatus(String id, ShipmentStatus newStatus);
}
