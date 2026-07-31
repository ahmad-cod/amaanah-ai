import '../../../../core/utils/result.dart';
import '../entities/shipment.dart';
import '../repositories/shipment_repository.dart';

class CreateShipment {
  final ShipmentRepository repository;

  const CreateShipment(this.repository);

  Future<Result<Shipment>> execute(Shipment shipment) {
    return repository.createShipment(shipment);
  }
}
