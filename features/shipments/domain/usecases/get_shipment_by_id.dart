import '../../../../core/utils/result.dart';
import '../entities/shipment.dart';
import '../repositories/shipment_repository.dart';

class GetShipmentById {
  final ShipmentRepository repository;

  const GetShipmentById(this.repository);

  Future<Result<Shipment>> execute(String id) {
    return repository.getShipmentById(id);
  }
}
